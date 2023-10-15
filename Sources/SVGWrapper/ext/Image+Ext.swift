#if os(iOS)
import UIKit
import SwiftDraw

/**
 * Extension to Image to add SVG support
 * - Remarks on content modes:
 * - `contentMode.scaleToFill` (scales all sides to fill)
 * - `contentMode.scaleAspectFill` (scales smaller side to fill, will overflow etc)
 * - `contentMode.center` (no scaling, might overflow)
 * - `contentMode.scaleAspectFit` (fits the largest side, won't overflow)
 */
extension Image {
   /**
    * Rasterizes the image with the given size
    * - Parameter size: The size to rasterize the image to
    * - Returns: The rasterized image
    */
   func rasterize(_ size: CGSize? = nil) -> UIImage {
      rasterize(with: size ?? self.size)
   }
   /**
    * Rasterizes the image with the given size
    * - Parameter size: The size to rasterize the image to
    * - Returns: The rasterized image
    * - Remark: This code is in SwiftDraw as well, but isn't public, or it is, but `NSImage` has the same name so maybe blocking it?
    * - Fixme: ⚠️️ We might have to add to `macOS` as well? `macOS` works with the swiftdraw call, its not blocked
    */
   func rasterize(with size: CGSize) -> UIImage {
      let f = UIGraphicsImageRendererFormat.default() // Create a default image renderer format
      f.opaque = false // Set the format to not be opaque
      f.preferredRange = .standard // Set the preferred range to standard
      let r = UIGraphicsImageRenderer(size: size, format: f) // Create an image renderer with the given size and format
      return r.image { // Render the image
         $0.cgContext.draw(self, in: CGRect(x: 0, y: 0, width: size.width, height: size.height)) // Draw the image in the given rectangle
      }
   }
}
#endif
