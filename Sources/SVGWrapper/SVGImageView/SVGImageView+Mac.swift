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
   var foregroundColor: NSColor?
   let bgColor: NSColor
   let preferedSize: CGSize?
   /**
    * - Important: ⚠️️ Unlike iOS, macOS doesn't seem to scale the svg, so prefered size is required, it seems at least for some svgs
    */
   public init(url: String, foregroundColor: NSColor? = .black, backgroundColor: NSColor = .clear/*, contentMode: NSView.ContentMode = .scaleAspectFill*/, preferedSize: CGSize? = nil) {
      self.foregroundColor = foregroundColor
      self.bgColor = backgroundColor
      self.preferedSize = preferedSize
      let img: NSImage? = Self.createImage(svgURLStr: url, preferedSize: preferedSize, foregroundColor: foregroundColor)
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
   public func setImage(url: String) {
      self.image = Self.createImage(svgURLStr: url, preferedSize: self.preferedSize, foregroundColor: foregroundColor)
      style(foregroundColor: foregroundColor, backgroundColor: bgColor)
   }
   /**
    * Style UIImageView
    */
   public func style(foregroundColor: NSColor?, backgroundColor: NSColor = .clear) {
      self.foregroundColor = foregroundColor
      if let color = foregroundColor { // Only set color if it is not nil
         self.contentTintColor = color
      }
      self.layer?.backgroundColor = backgroundColor.cgColor
   }
   /**
    * Image
    * - Note: On tinting and template image: https://gist.github.com/usagimaru/c0a03ef86b5829fb9976b650ec2f1bf4
    * - Note: Alternate tinting here: https://stackoverflow.com/questions/45028530/set-image-color-of-a-template-image
    */
   private static func createImage(svgURLStr: String, preferedSize: CGSize?, foregroundColor: NSColor?) -> NSImage? {
      let svgURL: URL = .init(fileURLWithPath: svgURLStr) // else { fatalError("⚠️️ Unable to create URL from: \(svgURLStr)") }// URL(string: "https://openclipart.org/download/181651/manhammock.svg")!
      guard let image = Image(fileURL: svgURL) else { return nil }
//      Swift.print("image.size:  \(image.size)")
      let size: CGSize = Self.aspectAdjustedSize(imageSize: image.size, preferedSize: preferedSize)
      let rasteredImage: NSImage = image.rasterize(with: size) // preferedSize
      if foregroundColor != nil {
         rasteredImage.isTemplate = true // let templatedImage = rasteredImage.withRenderingMode(.alwaysTemplate) // render as template (I presume its needed to support tint color?)
      }
      return rasteredImage // templatedImage // let uiImage = UIImage.init(cgImage: templated.cgImage!, scale: rasteredImage.scale, orientation: rasteredImage.imageOrientation)
   }
   /**
    * Adjust size to ratio
    * - Note: This exists because NSImage doesnt have scaleToFit etc like iOS has (it might have something similar but, was not able to find it)
    */
   private static func aspectAdjustedSize(imageSize: CGSize, preferedSize: CGSize?) -> CGSize{
      guard var customSize = preferedSize else { return imageSize }
//      Swift.print("ratio:  \(ratio)")
      if imageSize.height > imageSize.width { // height > width
         let ratio: CGFloat = imageSize.width / imageSize.height
         customSize.width = customSize.width * ratio
      } else if imageSize.width > imageSize.height { // width > height
         let ratio: CGFloat = imageSize.height / imageSize.width
         customSize.height = customSize.height * ratio
      } // else { } do nothing
//      Swift.print("customSize:  \(customSize)")
      return customSize
   }
}
#endif
