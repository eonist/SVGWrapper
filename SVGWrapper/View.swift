import UIKit
import SwiftSVG
import Spatial
import With
import SwiftDraw
import FileSugar
//import SwiftDraw

class View: UIView {
   /**
    * Init
    */
   override init(frame: CGRect) {
      super.init(frame: frame)
//      let testView = with(SVGIconButton.init(iconSize: .init(width: 32, height: 32), color: .systemPurple)) {
//         addSubview($0)
//         $0.anchorAndSize(to: self, width: 48, height: 48)
//      }
//      _ = testView
//      Swift.print(Bundle.main.resourcePath!+"/Assets.bundle/shopify.svg")
//      Swift.print(Self.content(Bundle.main.resourcePath! + "/Assets.bundle/shopify.svg")!)//Output: testing✌️
      let svgURLStr: String = Bundle.main.resourcePath! + "/Assets.bundle/shopify.svg"
      let svgURL = URL.init(fileURLWithPath: svgURLStr) // else { fatalError("⚠️️ Unable to create URL from: \(svgURLStr)") }// URL(string: "https://openclipart.org/download/181651/manhammock.svg")!
      let exists = FileAsserter.exists(path: svgURL.path)
      Swift.print("exists:  \(exists)")
//      let data = try? Data(contentsOf: svgURL)
//      Swift.print("data.count:  \(data?.count)")
      guard let image = Image(fileURL: svgURL) else { return }
      
      // someway access the fill and stroke etc
      // get access to internal bounds to center the svg
      
      Swift.print("image.size:  \(image.size)")
      let rasteredImage = image.rasterize()
//
////      addSubview(image)
//
////      .rasterize()
      let uiImage = UIImage.init(cgImage: rasteredImage.cgImage!, scale: rasteredImage.scale, orientation: rasteredImage.imageOrientation)
      let uiImageView = UIImageView.init(image: uiImage)
      addSubview(uiImageView)
      
      
   }
   /**
    * Boilerplate
    */
   required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}
/**
 * Helper
 */
extension View {
   /**
    *
    */
   static func content(_ path: String) -> String? {
      do {
         let content = try String(contentsOfFile: path, encoding: .utf8) as String//encoding: NSUTF8StringEncoding
         return content
      } catch {
         return nil
      }
   }
}

extension Image {
   func rasterize() -> UIImage {
      return rasterize(with: size)
   }
   
   func rasterize(with size: CGSize) -> UIImage {
      let f = UIGraphicsImageRendererFormat.default()
      f.opaque = false
      f.prefersExtendedRange = false
      let r = UIGraphicsImageRenderer(size: size, format: f)
      
      return r.image{
         $0.cgContext.draw(self, in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
      }
   }
}
//public extension UIImage {
//   convenience init?(svgNamed name: String, in bundle: Bundle = Bundle.main) {
//      guard let image = Image(named: name, in: bundle)?.rasterize(),
//         let cgImage = image.cgImage else {
//            return nil
//      }
//
//      self.init(cgImage: cgImage, scale: image.scale, orientation: image.imageOrientation)
//   }
//}
