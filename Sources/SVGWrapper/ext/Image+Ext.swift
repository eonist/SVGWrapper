#if os(iOS)
import UIKit
import SwiftDraw
/**
 * - Note: contentMode.scaleToFill (scales all sides to fill)
 * - Note: contentMode.scaleAspectFill (scalles smallet side to fill, will overflow etc)
 * - Note: contentMode.center (no scaling, might overflow)
 * - Note: contentMode.scaleAspectFit (fits the largest side, wont overflow)
 */
extension Image /*SVG*/ {
   func rasterize(_ size: CGSize? = nil) -> UIImage {
      rasterize(with: size ?? self.size)
   }
   /**
    * This code is in SwiftDraw as well, but isnt public, or it is, but NSImage has the same name so maybe blocking it?
    * - Fixme: ⚠️️ we might have to add to macOS as well? macos works with the swiftdraw call, its not blocked
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
