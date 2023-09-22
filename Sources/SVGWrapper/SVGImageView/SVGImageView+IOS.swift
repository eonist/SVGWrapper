#if os(iOS)
import UIKit
import SwiftDraw
/**
 * ## Examples:
 * let svgImgView = SVGImgView(url: "soundcloud.svg", foregroundColor: .red, backgroundColor: .blue, contentMode: .scaleAspectFill) // svgimgview extends UIImageView
 * addSubview(svgImgView)
 * svgImgView.anchorAndSize(to: self, width: 200, height: 200, align: .centerCenter, alignTo: .centerCenter)
 */
public final class SVGImageView: UIImageView {
   var foregroundColor: UIColor?
   let bgColor: UIColor
   let preferedSize: CGSize?
   /**
    * Initializes a new SVGImageView instance with the specified parameters.
    * - Parameters:
    *   - url: The URL of the SVG file to load.
    *   - foregroundColor: The color to use for the SVG's foreground.
    *   - backgroundColor: The color to use for the SVG's background.
    *   - contentMode: The content mode to use for the image view.
    *   - preferedSize: The size to rasterize the SVG at. If not provided, the size of the SVG is used.
    */
   public init(url: String, foregroundColor: UIColor? = .black, backgroundColor: UIColor = .clear, contentMode: UIView.ContentMode = .scaleAspectFill, preferedSize: CGSize? = nil) {
      self.foregroundColor = foregroundColor // Set the foreground color of the SVG image view
      self.bgColor = backgroundColor // Set the background color of the SVG image view
      self.preferedSize = preferedSize // Set the preferred size of the SVG image view
      // FIXME: We might want to just call setImage for simplicity.
      // Create a UIImage instance from the SVG file at the specified URL, with the specified parameters
      let img: UIImage? = Self.createImage(svgURLStr: url, preferedSize: preferedSize, foregroundColor: foregroundColor)
      super.init(image: img) // Initialize the SVG image view with the created UIImage instance
      self.contentMode = .scaleAspectFit // Set the content mode of the SVG image view
      style(foregroundColor: self.foregroundColor, backgroundColor: self.bgColor) // Apply styling to the SVG image view
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
    * Sets the image of the SVG image view to the SVG file at the specified URL.
    * - Parameters:
    *   - url: The URL of the SVG file to load.
    */
   public func setImage(url: String) {
      self.image = Self.createImage(svgURLStr: url, preferedSize: preferedSize, foregroundColor: foregroundColor)
      style(foregroundColor: foregroundColor, backgroundColor: bgColor)
   }

   /**
    * Applies styling to the SVG image view.
    * - Parameters:
    *   - foregroundColor: The color to use for the SVG's foreground.
    *   - backgroundColor: The color to use for the SVG's background.
    */
   public func style(foregroundColor: UIColor?, backgroundColor: UIColor = .clear) {
      self.foregroundColor = foregroundColor // Set the foreground color of the SVG image view
      if let color = foregroundColor { // Only set color if it is not nil
         self.tintColor = color // Set the tint color of the SVG image view to the foreground color
      }
      self.backgroundColor = backgroundColor // Set the background color of the SVG image view
   }

   /**
    * Creates a UIImage instance from the SVG file at the specified URL, with the specified parameters.
    * - Parameters:
    *   - svgURLStr: The URL of the SVG file to load.
    *   - preferedSize: The size to rasterize the SVG at. If not provided, the size of the SVG is used.
    *   - foregroundColor: The color to use for the SVG's foreground.
    * - Returns: A new UIImage instance, or nil if the SVG file could not be loaded.
    */
   public static func createImage(svgURLStr: String, preferedSize: CGSize?, foregroundColor: UIColor?) -> UIImage? {
      guard FileManager().fileExists(atPath: svgURLStr) else { return nil } // Check if the SVG file exists at the specified URL
      let svgURL: URL = .init(fileURLWithPath: svgURLStr) // Create a URL instance from the SVG file path
      guard let image = Image(fileURL: svgURL) else { return nil } // Create an Image instance from the SVG file
      let rasteredImage: UIImage = image.rasterize(with: preferedSize ?? image.size) // Rasterize the Image instance to a UIImage instance with the specified size
      return foregroundColor == nil ? rasteredImage : rasteredImage.withRenderingMode(.alwaysTemplate) // Return the rasterized UIImage instance with the specified rendering mode (if foreground color is not nil)
   }
}
#endif
