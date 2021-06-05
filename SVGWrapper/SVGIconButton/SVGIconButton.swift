import UIKit
import Spatial
import SwiftSVG
/**
 * TestView
 */
class SVGIconButton: UIView {
//   lazy var svgGraphic: UIView = createSVGGraphic()
   var iconSize: CGSize // Internal fixed size for icon
   var color: UIColor // Ascent color of icon
   init(iconSize: CGSize, color: UIColor) {
      self.iconSize = iconSize
      self.color = color
      super.init(frame: .zero)
      self.backgroundColor = .systemGreen
//      _ = svgGraphic
   }
   /**
    * Boilerplate
    */
   required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}
