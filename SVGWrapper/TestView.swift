import UIKit
/**
 * TestView
 */
class TestView: UIView {
   init() {
      super.init(frame: .zero)
      self.backgroundColor = .systemGreen
   }
   /**
    * Boilerplate
    */
   required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}
//let svgURL = URL(string: "https://openclipart.org/download/181651/manhammock.svg")!
//let hammock = UIView(SVGURL: svgURL) { (svgLayer) in
//   svgLayer.fillColor = UIColor.systemBlue.cgColor // UIColor(red:0.52, green:0.16, blue:0.32, alpha:1.00).cgColor
//   svgLayer.resizeToFit(self.bounds) // uses the smallest side
//   self.addSubview(hammock)
//}
