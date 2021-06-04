import UIKit
import SwiftSVG

class View: UIView {
   override init(frame: CGRect) {
      super.init(frame: frame)
      let svgURL = URL(string: "https://openclipart.org/download/181651/manhammock.svg")!
      let hammock = UIView(SVGURL: svgURL) { (svgLayer) in
         svgLayer.fillColor = UIColor.systemBlue.cgColor//UIColor(red:0.52, green:0.16, blue:0.32, alpha:1.00).cgColor
         svgLayer.resizeToFit(self.bounds) // uses the smallest side
         // - Fixme: ⚠️️ try with autolayout maybe?
         // - Fixme: ⚠️️ try to center align
         // - Fixme: ⚠️️ try custom color
         // - Fixme: ⚠️️ try resize
         // - Fixme: ⚠️️ try dual color?
         // - Fixme: ⚠️️ try iOS and mac
         // - Fixme: ⚠️️ clean up issues / tasks etc
      }
      self.addSubview(hammock)
   }
   /**
    * Boilerplate
    */
   required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}
