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
      let imageView: SVGImageView = .init(
         url: svgURLStr, // The URL of the SVG file to load.
         foregroundColor: .red, // The color of the SVG foreground.
         backgroundColor: .systemGreen, // The color of the SVG background.
         contentMode: .scaleAspectFit, // The content mode of the SVG image view.
         preferedSize: size // The preferred size of the SVG image view.
      )
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
   required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}
