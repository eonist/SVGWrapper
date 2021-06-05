import UIKit
import Spatial
//import SwiftSVG
/**
 * Create
 */
//extension SVGIconButton {
//   /**
//    * SVGGraphic
//    * - Fixme: ⚠️️ this aspect-ratio scales CASHapeLayer: https://stackoverflow.com/questions/30434615/transforming-a-cashapelayer-to-a-specific-size-in-swift
//    */
//   func createSVGGraphic() -> UIView {
//      // - Fixme: ⚠️️ make a method that takes url str and creates svg
//      let svgURLStr: String = Bundle.main.resourcePath! + "/Assets.bundle/apple.svg"
//      guard let svgURL = URL(string: svgURLStr) else { fatalError("⚠️️ Unable to create URL from: \(svgURLStr)") }// URL(string: "https://openclipart.org/download/181651/manhammock.svg")!
//      let content = try? String(contentsOfFile: svgURL.path, encoding: .utf8)
//      let data = Data(content!.utf8)
//      //      typealias OnComplete = (_ svgLayer: SVGLayer) -> Void
//      //      UIView.init(SVGData: )
//      //      let view: UIView = .init(frame: .zero) // .init(frame: .init(origin: .zero, size: .init(width: 200, height: 200)))
//      //      let onComplete: OnComplete = { svgLayer in
//      ////         self.addSubview(svgGraphic)
//      //         self.layer.addSublayer(svgLayer)
//      //         Swift.print("svgLayer.boundingBox.width:  \(svgLayer.boundingBox.width)")
//      ////      }
//      let svgLayer = CALayer(SVGData: data) { (svgLayer) in
//         svgLayer.fillColor = self.color.cgColor // UIColor(red:0.52, green:0.16, blue:0.32, alpha:1.00).cgColor
//         Swift.print("svgLayer.boundingBox:  \(svgLayer.boundingBox)")
//         //         svgLayer.resizeToFit(newRect)/*self.iconSize))*/ // uses the smallest side
//         //         Swift.print("svgLayer:  \(svgLayer.bounds)")
//         //         Swift.print("svgLayer.sublayers?.count:  \(svgLayer.sublayers?.count)")
//         //         onComplete(svgLayer)
//         Swift.print("svgLayer.sublayers.count:  \(svgLayer.sublayers?.count)")
//         Swift.print("svgLayer.sublayers?.first?.bounds:  \(svgLayer.sublayers?.first?.bounds)")
//         Swift.print("svgLayer.bounds:  \(svgLayer.bounds)")
//         //         svgLayer.sublayers?.first?.frame = .init(x: 110, y: 110, width: 100, height: 100)
//         //         svgLayer.sublayers.count
//      }
//      //      let view = UIView.initialize(svgData: data)
//      //      addSubview(view)
//      let view = UIView()
//      addSubview(view)
//      view.layer.addSublayer(svgLayer)
//      return view
//   }
//}
