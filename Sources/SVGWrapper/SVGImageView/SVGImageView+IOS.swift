#if os(iOS)
import UIKit
import SwiftDraw
import FileSugar
/**
 * ## Examples:
 * let svgImgView = SVGImgView(url: "soundcloud.svg", foregroundColor: .red, backgroundColor: .blue, contentMode: .scaleAspectFill) // svgimgview extends UIImageView
 * addSubview(svgImgView)
 * svgImgView.anchorAndSize(to: self, wifth: 200, height: 200, align: .centerCenter, alignTo: .centerCenter)
 */
public class SVGImageView: UIImageView {
   let foregroundColor: UIColor
   let bgColor: UIColor
   let preferedSize: CGSize?
   /**
    * - Parameters:
    *   - url: "soundcloud.svg"
    *   - foregroundColor: .red
    *   - backgroundColor: .blue
    *   - contentMode: .scaleAspectFill etc
    *   - preferedSize: the size that the icon is rasterized at
    */
   public init(url: String, foregroundColor: UIColor = .black, backgroundColor: UIColor = .clear, contentMode: UIView.ContentMode = .scaleAspectFill, preferedSize: CGSize? = nil) {
      self.foregroundColor = foregroundColor
      self.bgColor = backgroundColor
      self.preferedSize = preferedSize
      let img: UIImage? = Self.createImage(svgURLStr: url, preferedSize: preferedSize)
//      Swift.print("file exists: \(FileAsserter.exists(path: url))")
//      Swift.print("img: \(img)")
//      Swift.print("img?.size: \(img?.size)")
      super.init(image: img)
      self.contentMode = .scaleAspectFit // .scaleToFill .scaleAspectFit .scaleAspectFill // .center
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
    */
   public func setImage(url: String) {
      self.image = Self.createImage(svgURLStr: url, preferedSize: preferedSize)
      style(foregroundColor: foregroundColor, backgroundColor: bgColor)
   }
   /**
    * Style UIImageView
    */
   public func style(foregroundColor: UIColor, backgroundColor: UIColor) {
      self.tintColor = foregroundColor
      self.backgroundColor = backgroundColor
   }
   /**
    * Image
    */
   public static func createImage(svgURLStr: String, preferedSize: CGSize?) -> UIImage? {
      let svgURL: URL = .init(fileURLWithPath: svgURLStr) // else { fatalError("⚠️️ Unable to create URL from: \(svgURLStr)") }// URL(string: "https://openclipart.org/download/181651/manhammock.svg")!
//      Swift.print("svgURL:  \(svgURL)")
      guard let image = Image(fileURL: svgURL) else { return nil }
      let rasteredImage: UIImage = image.rasterize(preferedSize)
      let templatedImage = rasteredImage.withRenderingMode(.alwaysTemplate) // render as template (I presume its needed to support tint color?)
      return templatedImage // let uiImage = UIImage.init(cgImage: templated.cgImage!, scale: rasteredImage.scale, orientation: rasteredImage.imageOrientation)
   }
}
#endif
