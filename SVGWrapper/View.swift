import UIKit
import SwiftSVG
import Spatial
import With

class View: UIView {
   override init(frame: CGRect) {
      super.init(frame: frame)
      let testView = with(TestView()) {
         addSubview($0)
         $0.anchorAndSize(to: self, width: 100, height: 42)
      }
      // add testview to view ✅
      // add graphic to view 👈
      // center graphic
      // add innerSize
      // add MUI
      // make
      // - Fixme: ⚠️️ try with autolayout maybe? 👈
         // import spatial etc, mui?
      // - Fixme: ⚠️️ try to center align
      // - Fixme: ⚠️️ try custom color
      // - Fixme: ⚠️️ try resize
      // - Fixme: ⚠️️ try dual color?
      // - Fixme: ⚠️️ try iOS and mac
      // - Fixme: ⚠️️ clean up issues / tasks etc
   }
   /**
    * Boilerplate
    */
   required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}

