import UIKit
@UIApplicationMain
/**
 * - Fixme: ⚠️️ Rename to SwiftSVGExample? not super imporatant
 */
class AppDelegate: UIResponder, UIApplicationDelegate {
   lazy var window: UIWindow? = createWindow()
   func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
      _ = window
      return true
   }
}
extension AppDelegate {
   func createWindow() -> UIWindow {
      let win = UIWindow(frame: UIScreen.main.bounds) // Create a new UIWindow instance with the screen bounds
      let vc = ViewController() // Create a new ViewController instance
      win.rootViewController = vc // Set the root view controller of the window to the view controller instance
      win.makeKeyAndVisible() // Make the window key and visible (important since there is no Main storyboard)
      return win // Return the created window instance
   }
}
