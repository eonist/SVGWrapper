import Cocoa
import Spatial

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
   @IBOutlet weak var window: NSWindow!
   /**
    * Creates the view
    */
   lazy var view: NSView = createView()
   func applicationDidFinishLaunching(_ aNotification: Notification) {
      _ = view
   }
}
extension AppDelegate {
   func createView() -> NSView {
      let contentRect = window.contentRect(forFrameRect: window.frame)/*size of win sans titlebar*/
      let view: View = .init(frame: contentRect)
      window.contentView = view
//      view.layer?.backgroundColor = NSColor.white.cgColor
      return view
   }
}
open class View: NSView {
   override open var isFlipped: Bool { true } /*TopLeft orientation*/
   override public init(frame: CGRect) {
      super.init(frame: frame) // Initialize the view with the specified frame
      Swift.print("hello world") // Print "hello world" to the console
      self.wantsLayer = true // Enable layer backing for the view
      self.layer?.backgroundColor = NSColor.systemYellow.cgColor // Set the background color of the view's layer
      let svgURLStr: String = Bundle.main.resourcePath! + "/Assets.bundle/user.svg" // Set the URL of the SVG file to load
      let size: CGSize = .init(width: 200, height: 200) // Set the size to rasterize the SVG at
      // Create a new SVGImageView instance with the specified parameters
      let imageView: SVGImageView = .init(url: svgURLStr, foregroundColor: .red, backgroundColor: .systemGreen, preferedSize: size)
      addSubview(imageView) // Add the SVG image view as a subview of the current view
      // Anchor and size the SVG image view to the current view
      imageView.anchorAndSize(
         to: self, // The view to anchor and size the view to.
         width: size.width, // The width of the view.
         height: size.height, // The height of the view.
         align: .centerCenter, // The horizontal and vertical alignment of the view.
         alignTo: .centerCenter // The horizontal and vertical alignment of the anchor view.
      )
   }
   /**
    * Boilerplate
    */
   public required init?(coder decoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}
