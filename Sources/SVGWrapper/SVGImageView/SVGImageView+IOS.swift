#if os(iOS)
import UIKit
import SwiftDraw
//import FileSugar
/**
 * ## Examples:
 * let svgImgView = SVGImgView(url: "soundcloud.svg", foregroundColor: .red, backgroundColor: .blue, contentMode: .scaleAspectFill) // svgimgview extends UIImageView
 * addSubview(svgImgView)
 * svgImgView.anchorAndSize(to: self, width: 200, height: 200, align: .centerCenter, alignTo: .centerCenter)
 */
public class SVGImageView: UIImageView {
   var foregroundColor: UIColor?
   let bgColor: UIColor
   let preferedSize: CGSize?
   /**
    * - Important: ⚠️️ if preferedSize is provided, aspect-ratio is lost, make sure the svgs are square (or make svgs bigger to raster at higher res, or redesign raster to work with destination size etc or something)
    * - Parameters:
    *   - url: "soundcloud.svg"
    *   - foregroundColor: .red
    *   - backgroundColor: .blue
    *   - contentMode: .scaleAspectFill etc
    *   - preferedSize: The size that the icon is rasterized at (if nothing is provided, the size of the svg is used)
    */
   public init(url: String, foregroundColor: UIColor? = .black, backgroundColor: UIColor = .clear, contentMode: UIView.ContentMode = .scaleAspectFill, preferedSize: CGSize? = nil) {
      // Swift.print("foregroundColor:  \(String(describing: foregroundColor))")
      self.foregroundColor = foregroundColor
      self.bgColor = backgroundColor
      self.preferedSize = preferedSize
      // - Fixme: ⚠️️ we might want to just call setImage, for simplicity etc
      let img: UIImage? = Self.createImage(svgURLStr: url, preferedSize: preferedSize, foregroundColor: foregroundColor)
      super.init(image: img)
      self.contentMode = .scaleAspectFit
      style(foregroundColor: self.foregroundColor, backgroundColor: self.bgColor)
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
    * - Fixme: ⚠️️ maybe set self.contentMode = .scaleAspectFit again here?
    */
   public func setImage(url: String) {
      self.image = Self.createImage(svgURLStr: url, preferedSize: preferedSize, foregroundColor: foregroundColor)
      style(foregroundColor: foregroundColor, backgroundColor: bgColor)
   }
   /**
    * Style UIImageView
    */
   public func style(foregroundColor: UIColor?, backgroundColor: UIColor = .clear) {
      self.foregroundColor = foregroundColor
      if let color = foregroundColor { // Only set color if it is not nil
         self.tintColor = color
      }
      self.backgroundColor = backgroundColor
   }
   /**
    * Image
    * - Note: if foregroundColor is nil, we dont template the image, needed to tint etc
    */
   public static func createImage(svgURLStr: String, preferedSize: CGSize?, foregroundColor: UIColor?) -> UIImage? {
      guard FileManager().fileExists(atPath: svgURLStr) else { return nil }
      let svgURL: URL = .init(fileURLWithPath: svgURLStr) // else { fatalError("⚠️️ Unable to create URL from: \(svgURLStr)") }// URL(string: "https://openclipart.org/download/181651/manhammock.svg")!
      guard let image = /*Image*/SVG(fileURL: svgURL) else { return nil }
      let rasteredImage: UIImage = image.rasterize(with: preferedSize ?? image.size)
      return foregroundColor == nil ? rasteredImage : rasteredImage.withRenderingMode(.alwaysTemplate) // render as template (I presume its needed to support tint color?)
   }
}
#endif
