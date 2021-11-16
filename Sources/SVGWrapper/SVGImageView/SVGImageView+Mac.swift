#if os(macOS)
import Cocoa
import SwiftDraw
/**
 * - Note: scalling nsimage: https://stackoverflow.com/questions/13750234/confused-about-nsimageview-scaling
 * - Note: More advance resizing: https://nshipster.com/image-resizing/
 * ## Examples:
 * let svgImgView = SVGImgView(url: "soundcloud.svg", foregroundColor: .red, backgroundColor: .blue, contentMode: .scaleAspectFill) // svgimgview extends UIImageView
 * addSubview(svgImgView)
 * svgImgView.anchorAndSize(to: self, wifth: 200, height: 200, align: .centerCenter, alignTo: .centerCenter)
 */
public class SVGImageView: NSImageView {
   let foregroundColor: NSColor
   let bgColor: NSColor
   let preferedSize: CGSize?
   /**
    * - Important: ⚠️️ Unlike iOS, macOS doesnt seem to scale the svg, so prefered size is required, it seems at least for some svgs
    */
   public init(url: String, foregroundColor: NSColor = .black, backgroundColor: NSColor = .clear/*, contentMode: NSView.ContentMode = .scaleAspectFill*/, preferedSize: CGSize? = nil) {
      self.foregroundColor = foregroundColor
      self.bgColor = backgroundColor
      self.preferedSize = preferedSize
      let img: NSImage? = Self.createImage(svgURLStr: url, preferedSize: preferedSize)
      super.init(frame: .zero)
      self.image = img
      self.wantsLayer = true // if true then view is layer backed
      style(foregroundColor: foregroundColor, backgroundColor: backgroundColor)
      // self.scaleUnitSquare(to: .init(width: 0, height: 0))
      // NSImageScaleAxesIndependently
   }
   /**
    * Boilerplate
    */
   @available(*, unavailable)
   required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}
/**
 * Helper
 */
extension SVGImageView {
   /**
    * Set image
    */
   func setImage(url: String) {
      self.image = Self.createImage(svgURLStr: url, preferedSize: self.preferedSize)
      style(foregroundColor: foregroundColor, backgroundColor: bgColor)
   }
   /**
    * Style UIImageView
    */
   public func style(foregroundColor: NSColor, backgroundColor: NSColor) {
      self.contentTintColor = foregroundColor
      self.layer?.backgroundColor = backgroundColor.cgColor
   }
   /**
    * Image
    * - Note: On tinting and template image: https://gist.github.com/usagimaru/c0a03ef86b5829fb9976b650ec2f1bf4
    * - Note: Alternate tinting here: https://stackoverflow.com/questions/45028530/set-image-color-of-a-template-image
    */
   private static func createImage(svgURLStr: String, preferedSize: CGSize?) -> NSImage? {
      let svgURL: URL = .init(fileURLWithPath: svgURLStr) // else { fatalError("⚠️️ Unable to create URL from: \(svgURLStr)") }// URL(string: "https://openclipart.org/download/181651/manhammock.svg")!
      guard let image = Image(fileURL: svgURL) else { return nil }
      let rasteredImage: NSImage = image.rasterize(with: preferedSize ?? image.size) // preferedSize
      rasteredImage.isTemplate = true // let templatedImage = rasteredImage.withRenderingMode(.alwaysTemplate) // render as template (I presume its needed to support tint color?)
      return rasteredImage // templatedImage // let uiImage = UIImage.init(cgImage: templated.cgImage!, scale: rasteredImage.scale, orientation: rasteredImage.imageOrientation)
   }
}
#endif
