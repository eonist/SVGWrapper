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
   public init(url: String, foregroundColor: NSColor = .black, backgroundColor: NSColor = .clear/*, contentMode: NSView.ContentMode = .scaleAspectFill*/) {
      let img: NSImage? = Self.createImage(svgURLStr: url)
      super.init(frame: .zero)
      self.image = img
      self.contentTintColor = foregroundColor
      self.wantsLayer = true // if true then view is layer backed
      self.layer?.backgroundColor = backgroundColor.cgColor
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
    * Image
    * - Note: on tinting and template image: https://gist.github.com/usagimaru/c0a03ef86b5829fb9976b650ec2f1bf4
    * - Note: alternate tinting here: https://stackoverflow.com/questions/45028530/set-image-color-of-a-template-image
    */
   private static func createImage(svgURLStr: String) -> NSImage? {
      let svgURL: URL = .init(fileURLWithPath: svgURLStr) // else { fatalError("⚠️️ Unable to create URL from: \(svgURLStr)") }// URL(string: "https://openclipart.org/download/181651/manhammock.svg")!
      guard let image = Image(fileURL: svgURL) else { return nil }
      let rasteredImage: NSImage = image.rasterize()
      rasteredImage.isTemplate = true // let templatedImage = rasteredImage.withRenderingMode(.alwaysTemplate) // render as template (I presume its needed to support tint color?)
      return rasteredImage // templatedImage // let uiImage = UIImage.init(cgImage: templated.cgImage!, scale: rasteredImage.scale, orientation: rasteredImage.imageOrientation)
   }
}
#endif
// 🏀 add 
