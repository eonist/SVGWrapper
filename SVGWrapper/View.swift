import UIKit
import SwiftSVG
import Spatial
import With

class View: UIView {
   /**
    * 
    */
   static func content(_ path: String) -> String? {
      do {
         let content = try String(contentsOfFile: path, encoding: .utf8) as String//encoding: NSUTF8StringEncoding
         return content
      } catch {
         return nil
      }
   }
   override init(frame: CGRect) {
      super.init(frame: frame)
      let testView = with(SVGIconButton.init(iconSize: .init(width: 32, height: 32), color: .systemPurple)) {
         addSubview($0)
         $0.anchorAndSize(to: self, width: 48, height: 48)
      }
      _ = testView
//      Swift.print(Bundle.main.resourcePath!+"/Assets.bundle/shopify.svg")
      
      Swift.print(Self.content(Bundle.main.resourcePath! + "/Assets.bundle/shopify.svg"))//Output: testing✌️
//      let cowboyHat = UIView(SVGNamed: "cowboyHat")     // In the asset catalog as a Data Asset
//      self.addSubview(cowboyHat)
      // add graphic to view 👈
      // - Fixme: ⚠️️ add SVGWrapper to DesktopUI, make SVGIconButton for MacOS 👈
      // make brandicon
      // make icon btn
      // add svg assets to folders
      // hock up dialog boxes
      // hoock up different detail types etc
   }
   /**
    * Boilerplate
    */
   required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}

