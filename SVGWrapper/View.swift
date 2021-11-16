import UIKit
import Spatial
import With
import SwiftDraw
import FileSugar

class View: UIView {
   /**
    * Init
    */
   override init(frame: CGRect) {
      super.init(frame: frame)
      let svgURLStr: String = Bundle.main.resourcePath! + "/Assets.bundle/user.svg" // soundcloud.svg
//      let svgURLStr: String = Bundle.main.resourcePath! + "/Assets.bundle/stack-overflow.svg " //plus.svgsoundcloud.svg
      let size: CGSize = .init(width: 200, height: 200)
      let imageView = SVGImageView.init(url: svgURLStr, foregroundColor: .red, backgroundColor: .systemGreen, contentMode: .scaleAspectFit, preferedSize: size)
      addSubview(imageView)
      imageView.anchorAndSize(to: self, width: size.width, height: size.height, align: .centerCenter, alignTo: .centerCenter)
   }
   /**
    * Boilerplate
    */
   required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}
