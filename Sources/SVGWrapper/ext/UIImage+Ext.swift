#if os(iOS)
import UIKit
import SwiftDraw

extension UIImage {
   /**
    * - Fixme: ⚠️️ not in use
    */
   convenience init?(svgNamed name: String, in bundle: Bundle = Bundle.main) {
      guard let image = Image/*SVG*/(named: name, in: bundle)?.rasterize(),
            let cgImage = image.cgImage else {
         return nil
      }
      self.init(cgImage: cgImage, scale: image.scale, orientation: image.imageOrientation)
   }
}
#endif
