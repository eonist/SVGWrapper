#if os(iOS)
import UIKit
import SwiftDraw
/**
 * - Note: contentMode.scaleToFill (scales all sides to fill)
 * - Note: contentMode.scaleAspectFill (scalles smallet side to fill, will overflow etc)
 * - Note: contentMode.center (no scaling, might overflow)
 * - Note: contentMode.scaleAspectFit (fits the largest side, wont overflow)
 */
extension Image {
   func rasterize() -> UIImage {
      return rasterize(with: size)
   }
   /**
    * - Fixme: ⚠️️ not sure where this code came from, might be in SwiftDraw
    */
   func rasterize(with size: CGSize) -> UIImage {
      let f = UIGraphicsImageRendererFormat.default()
      f.opaque = false
      f.preferredRange = .standard
      let r = UIGraphicsImageRenderer(size: size, format: f)
      return r.image{
         $0.cgContext.draw(self, in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
      }
   }
}

#endif
