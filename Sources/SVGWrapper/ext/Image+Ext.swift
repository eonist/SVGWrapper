#if os(iOS)
import UIKit
import SwiftDraw
/**
 * - Remark: `contentMode.scaleToFill` (scales all sides to fill)
 * - Remark: `contentMode.scaleAspectFill` (scalles smallet side to fill, will overflow etc)
 * - Remark: `contentMode.center` (no scaling, might overflow)
 * - Remark: `contentMode.scaleAspectFit` (fits the largest side, won't overflow)
 */
extension Image { /*SVG*/ 
   func rasterize(_ size: CGSize? = nil) -> UIImage {
      rasterize(with: size ?? self.size)
   }
   /**
    * This code is in SwiftDraw as well, but isn't public, or it is, but `NSImage` has the same name so maybe blocking it?
    * - Fixme: ⚠️️ We might have to add to `macOS` as well? `macOS` works with the swiftdraw call, its not blocked
    */
   func rasterize(with size: CGSize) -> UIImage {
      let f = UIGraphicsImageRendererFormat.default()
      f.opaque = false
      f.preferredRange = .standard
      let r = UIGraphicsImageRenderer(size: size, format: f)
      return r.image {
         $0.cgContext.draw(self, in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
      }
   }
}
#endif
