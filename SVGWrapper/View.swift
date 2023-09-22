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
      // Set the URL of the SVG file to load
      let svgURLStr: String = Bundle.main.resourcePath! + "/Assets.bundle/airbnb.svg" // soundcloud.svg
      // let svgURLStr: String = Bundle.main.resourcePath! + "/Assets.bundle/stack-overflow.svg " //plus.svgsoundcloud.svg
      let size: CGSize = .init(width: 200, height: 200) // Set the size to rasterize the SVG at
      // Create a new SVGImageView instance with the specified parameters
      let imageView: SVGImageView = .init(url: svgURLStr, foregroundColor: .red, backgroundColor: .systemGreen, contentMode: .scaleAspectFit, preferedSize: size)
      addSubview(imageView) // Add the SVG image view as a subview of the current view
      // Anchor and size the SVG image view to the current view
      imageView.anchorAndSize(to: self, width: size.width, height: size.height, align: .centerCenter, alignTo: .centerCenter)
   }
   /**
    * Boilerplate
    */
   required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}
