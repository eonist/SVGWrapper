#if os(macOS)
import Cocoa
import SwiftDraw
/**
 * - Remark: Scalling NSImage: https://stackoverflow.com/questions/13750234/confused-about-nsimageview-scaling
 * - Remark: More advance resizing: https://nshipster.com/image-resizing/
 * ## Examples:
 * let svgImgView = SVGImgView(url: "soundcloud.svg", foregroundColor: .red, backgroundColor: .blue, contentMode: .scaleAspectFill) // svgimgview extends UIImageView
 * addSubview(svgImgView)
 * svgImgView.anchorAndSize(to: self, wifth: 200, height: 200, align: .centerCenter, alignTo: .centerCenter)
 */
public final class SVGImageView: NSImageView {
   var foregroundColor: NSColor? // The color to use for the SVG's foreground
   let bgColor: NSColor // The color to use for the SVG's background
   let preferedSize: CGSize? // The size to rasterize the SVG at. Required for macOS, but optional for iOS.
   /**
    * Initializes a new SVGImageView instance with the specified parameters.
    * - Parameters:
    *   - url: The URL of the SVG file to load.
    *   - foregroundColor: The color to use for the SVG's foreground.
    *   - backgroundColor: The color to use for the SVG's background.
    *   - preferedSize: The size to rasterize the SVG at. Required for macOS, but optional for iOS.
    */
   public init(url: String, foregroundColor: NSColor? = .black, backgroundColor: NSColor = .clear, preferedSize: CGSize? = nil) {
      self.foregroundColor = foregroundColor // Set the foreground color of the SVG image view
      self.bgColor = backgroundColor // Set the background color of the SVG image view
      self.preferedSize = preferedSize // Set the preferred size of the SVG image view
      // Create an NSImage instance from the SVG file at the specified URL, with the specified parameters
      let img: NSImage? = Self.createImage(svgURLStr: url, preferedSize: preferedSize, foregroundColor: foregroundColor)
      super.init(frame: .zero) // Initialize the SVG image view with a zero-sized frame
      self.image = img // Set the image of the SVG image view to the created NSImage instance
      self.wantsLayer = true // Enable layer backing for the view
      style(foregroundColor: foregroundColor, backgroundColor: backgroundColor) // Apply styling to the SVG image view
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
    * - Parameter url: The URL of the SVG file to load.
    */
   public func setImage(url: String) {
      // Set the image of the SVG image view to the created NSImage instance from the SVG file at the specified URL, with the specified parameters
      self.image = Self.createImage(svgURLStr: url, preferedSize: self.preferedSize, foregroundColor: foregroundColor)
      // Apply styling to the SVG image view
      style(foregroundColor: foregroundColor, backgroundColor: bgColor)
   }

   /**
    * Applies styling to the SVG image view.
    * - Parameters:
    *   - foregroundColor: The color to use for the SVG's foreground.
    *   - backgroundColor: The color to use for the SVG's background.
    */
   public func style(foregroundColor: NSColor?, backgroundColor: NSColor = .clear) {
      self.foregroundColor = foregroundColor
      if let color = foregroundColor { // Only set color if it is not nil
         self.contentTintColor = color // Set the content tint color of the SVG image view to the foreground color
      }
      self.layer?.backgroundColor = backgroundColor.cgColor // Set the background color of the SVG image view's layer
   }
   /**
    * Creates an NSImage instance from the SVG file at the specified URL, with the specified parameters.
    * - Parameters:
    *   - svgURLStr: The URL of the SVG file to load.
    *   - preferedSize: The size to rasterize the SVG at. If not provided, the size of the SVG is used.
    *   - foregroundColor: The color to use for the SVG's foreground.
    * - Returns: A new NSImage instance, or nil if the SVG file could not be loaded.
    */
   private static func createImage(svgURLStr: String, preferedSize: CGSize?, foregroundColor: NSColor?) -> NSImage? {
      guard FileManager().fileExists(atPath: svgURLStr) else { return nil } // Check if the SVG file exists at the specified URL
      let svgURL: URL = .init(fileURLWithPath: svgURLStr) // Create a URL instance from the SVG file path
      guard let image = /*SVG*/Image(fileURL: svgURL) else { return nil } // Create an Image instance from the SVG file
      let size: CGSize = Self.aspectAdjustedSize(imageSize: image.size, preferedSize: preferedSize) // Calculate the aspect-adjusted size to rasterize the SVG at
      let rasteredImage: NSImage = image.rasterize(with: size) // Rasterize the Image instance to an NSImage instance with the calculated size
      if foregroundColor != nil {
         rasteredImage.isTemplate = true // Set the NSImage instance to render as a template (to support tint color)
      }
      return rasteredImage // Return the rasterized NSImage instance
   }
   /**
    * Calculates the aspect-adjusted size to rasterize the SVG at, based on the provided image size and preferred size.
    * - Parameters:
    *   - imageSize: The size of the SVG image.
    *   - preferedSize: The preferred size to rasterize the SVG at. If not provided, the size of the SVG is used.
    * - Returns: The aspect-adjusted size to rasterize the SVG at.
    */
   private static func aspectAdjustedSize(imageSize: CGSize, preferedSize: CGSize?) -> CGSize {
      guard var customSize = preferedSize else { return imageSize } // If no preferred size is provided, return the original image size
      if imageSize.height > imageSize.width { // If the image height is greater than the width
         let ratio: CGFloat = imageSize.width / imageSize.height // Calculate the aspect ratio
         customSize.width *= ratio // Adjust the width based on the aspect ratio
      } else if imageSize.width > imageSize.height { // If the image width is greater than the height
         let ratio: CGFloat = imageSize.height / imageSize.width // Calculate the aspect ratio
         customSize.height *= ratio // Adjust the height based on the aspect ratio
      } // If the image is square, do nothing
      return customSize // Return the aspect-adjusted size
   }
}
#endif
