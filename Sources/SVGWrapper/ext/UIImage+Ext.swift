#if os(iOS)
import UIKit
import SwiftDraw

extension UIImage {
   /**
    * Initializes a new UIImage instance from an SVG file with the specified name.
    * - Parameter name: The name of the SVG file to load.
    * - Parameter bundle: The bundle containing the SVG file. Defaults to the main bundle.
    * - Returns: A new UIImage instance, or nil if the SVG file could not be loaded.
    */
   convenience init?(svgNamed name: String, in bundle: Bundle = Bundle.main) {
      guard let image = Image(named: name, in: bundle)?.rasterize(),
            let cgImage = image.cgImage else {
         return nil
      }
      self.init(cgImage: cgImage, scale: image.scale, orientation: image.imageOrientation)
   }
}
#endif