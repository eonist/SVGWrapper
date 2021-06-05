import UIKit
import SwiftSVG
import Spatial
import With

class View: UIView {
   override init(frame: CGRect) {
      super.init(frame: frame)
      let testView = with(SVGIconButton.init(iconSize: .init(width: 32, height: 32), color: .systemPurple)) {
         addSubview($0)
         $0.anchorAndSize(to: self, width: 100, height: 42)
      }
      _ = testView
//      let cowboyHat = UIView(SVGNamed: "cowboyHat")     // In the asset catalog as a Data Asset
//      self.addSubview(cowboyHat)
      // add testview to view ✅
      // add graphic to view 👈
      // try named data asset? 🚫
      // center graphic ✅
      // add innerSize✅
      // add MUI 🚫
      // make
      // - Fixme: ⚠️️ try with autolayout maybe? ✅
         // import spatial etc, mui?
      // - Fixme: ⚠️️ try to center align ✅
      // - Fixme: ⚠️️ try custom color ✅
      // - Fixme: ⚠️️ try resize ✅
      // - Fixme: ⚠️️ try dual color? 🚫
      // - Fixme: ⚠️️ try iOS and mac ✅ 🚫
      // - Fixme: ⚠️️ clean up issues / tasks etc ✅
      // - Fixme: ⚠️️ add svgWrapper to DesktopUI, make SVGIconButton for MacOS 👈 
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

