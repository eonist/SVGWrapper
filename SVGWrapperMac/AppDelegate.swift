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
   override open var isFlipped: Bool { true }/*TopLeft orientation*/
   override public init(frame: CGRect) {
      super.init(frame: frame)
      Swift.print("hello world")
      self.wantsLayer = true/*if true then view is layer backed*/
      self.layer?.backgroundColor = NSColor.systemYellow.cgColor
      let svgURLStr: String = Bundle.main.resourcePath! + "/Assets.bundle/user.svg" // apple.svg soundcloud.svg
      let size: CGSize = .init(width: 200, height: 200)
      let imageView: SVGImageView = .init(url: svgURLStr, foregroundColor: .red, backgroundColor: .systemGreen/*, contentMode: .scaleAspectFit*/, preferedSize: size)
      addSubview(imageView)
      imageView.anchorAndSize(to: self, width: size.width, height: size.height, align: .centerCenter, alignTo: .centerCenter)
   }
   /**
    * Boilerplate
    */
   public required init?(coder decoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}
