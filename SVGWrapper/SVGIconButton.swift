import UIKit
import Spatial
/**
 * TestView
 */
class SVGIconButton: UIView {
   lazy var svgGraphic: UIView = createSVGGraphic()
   var iconSize: CGSize // Internal fixed size for icon
   var color: UIColor // Ascent color of icon
   init(iconSize: CGSize, color: UIColor) {
      self.iconSize = iconSize
      self.color = color
      super.init(frame: .zero)
      self.backgroundColor = .systemGreen
      _ = svgGraphic
   }
   /**
    * Boilerplate
    */
   required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}
/**
 * Create
 */
extension SVGIconButton {
   /**
    * SVGGraphic
    */
   func createSVGGraphic() -> UIView {
      let svgURL = URL(string: "https://openclipart.org/download/181651/manhammock.svg")!
      let svgGraphic = UIView(SVGURL: svgURL) { (svgLayer) in
         svgLayer.fillColor = self.color.cgColor // UIColor(red:0.52, green:0.16, blue:0.32, alpha:1.00).cgColor
         svgLayer.resizeToFit(.init(origin: .zero, size: self.iconSize)) // uses the smallest side
      }
      self.addSubview(svgGraphic)
      svgGraphic.anchorAndSize(to: self, width: self.iconSize.width, height: self.iconSize.height, align: .centerCenter, alignTo: .centerCenter, sizeOffset: .zero)
      return svgGraphic
   }
}
