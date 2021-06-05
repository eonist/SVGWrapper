import UIKit
import Spatial
import SwiftSVG
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
      let svgURLStr: String = Bundle.main.resourcePath! + "/Assets.bundle/apple.svg"
//      _ = svgURLStr
      guard let svgURL = URL(string: svgURLStr) else { fatalError("⚠️️ unable to create URL from: \(svgURLStr)") }// URL(string: "https://openclipart.org/download/181651/manhammock.svg")!
//      Swift.print(Self.content(Bundle.main.resourcePath! + "/Assets.bundle/shopify.svg"))//Output: testing✌️
      Swift.print("svgURL:  \(svgURL)")
      Swift.print("svgURL.absoluteString:  \(svgURL.absoluteString)")
      // try absolute URL, try passing Data?
      let content = try? String(contentsOfFile: svgURL.path, encoding: .utf8)
      let data = Data(content!.utf8)
      Swift.print("data.count:  \(data.count)")
//      Swift.print("content:  \(content)")
//      let svgData = try? Data(contentsOf: URL.init(string: svgURL.path)!)
//      Swift.print("svgData.count:  \(svgData?.count)")
      let svgGraphic = UIView.init(SVGData: data) { (svgLayer) in // UIView.init(SVGURL: svgURL)
         Swift.print("svgLayer.boundingBox:  \(svgLayer.boundingBox)")
         svgLayer.fillColor = self.color.cgColor // UIColor(red:0.52, green:0.16, blue:0.32, alpha:1.00).cgColor
//         svgLayer.resizeToFit(.init(origin: .zero, size: .init(width: 48, height: 48)/*self.iconSize*/)) // uses the smallest side
         let offset: CGPoint = .init(x: -4, y: -32)
         let toSize: CGSize = .init(width: 48, height: 48)
//         let newWidth: CGFloat = svgLayer.boundingBox.width
         let newSize: CGSize = {
            if svgLayer.boundingBox.width > svgLayer.boundingBox.height { // landscape
               let multiplier = toSize.width / svgLayer.boundingBox.width
               return .init(width: toSize.width, height: svgLayer.boundingBox.height * multiplier)
            } else { // portrait
               let multiplier = toSize.height / svgLayer.boundingBox.height
               return .init(width: svgLayer.boundingBox.width * multiplier, height: toSize.height)
            }
         }()
         Swift.print("newSize:  \(newSize)")
      }
      self.addSubview(svgGraphic)
//      svgGraphic.anchorAndSize(to: self, width: self.iconSize.width, height: self.iconSize.height, align: .centerCenter, alignTo: .centerCenter, sizeOffset: .zero)
      return svgGraphic
   }
}
// add .svg brand icon to project, and try to load it
   // read up on .bundle 👈
// add the same to desktopUI, make a dummy test view and try to load it
// try to make the brand and icon btns etc in desktopui 👈
