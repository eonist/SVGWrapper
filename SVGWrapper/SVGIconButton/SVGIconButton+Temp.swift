import UIKit
// add .svg brand icon to project, and try to load it
// read up on .bundle 👈
// add the same to desktopUI, make a dummy test view and try to load it
// try to make the brand and icon btns etc in desktopui 👈
//typealias OnComplete = (_ svgLayer: SVGLayer) -> Void
/**
 *
 */
extension UIView {
   /**
    * initialize
    */
//   public static func initialize(svgData: Data) -> UIView {
//      Swift.print("initialize()")
//      //      let semaphore = DispatchSemaphore(value: 0)
//      let onComplete: OnComplete = { svgLayer in
//         Swift.print("OnComplete svgLayer.boundingBox.width:  \(svgLayer.boundingBox.width)")
//      }
//      let svgLayer = CALayer(SVGData: svgData) { (svgLayer) in
//         Swift.print("svglayer")
//         onComplete(svgLayer)
//      }
//      //      semaphore.wait() // (wallTimeout: .distantFuture)
//      let view = UIView()
//      view.layer.addSublayer(svgLayer)
//      return view
//   }
}
// UIView.init(SVGData: Data)
// let view: UIView = .init(frame: .zero) // .init(frame: .init(origin: .zero, size: .init(width: 200, height: 200)))
//
// extension SVGIconButton {
//   /**
//    *
//    */
//   func size() {
//      //
////      let offset: CGPoint = .init(x: -4, y: -32)
////      let toSize: CGSize = .init(width: 48, height: 48)
////      //         let newWidth: CGFloat = svgLayer.boundingBox.width
////      let newSize: CGSize = {
////         if svgLayer.boundingBox.width > svgLayer.boundingBox.height { // landscape
////            let multiplier = toSize.width / svgLayer.boundingBox.width
////            return .init(width: toSize.width, height: svgLayer.boundingBox.height * multiplier)
////         } else { // portrait
////            let multiplier = toSize.height / svgLayer.boundingBox.height
////            return .init(width: svgLayer.boundingBox.width * multiplier, height: toSize.height)
////         }
////      }()
////      // .init(origin: .zero, size: .init(width: 48, height: 48
////      let newRect: CGRect = .init(origin: offset, size: newSize)
////      Swift.print("newRect:  \(newRect)")
//   }
//}
////      let svgGraphic = UIView.init(SVGData: data) { (svgLayer: SVGLayer) in // UIView.init(SVGURL: svgURL)
////         Swift.print("svgLayer.boundingBox:  \(svgLayer.boundingBox)")
////         layer = svgLayer
//
////
////         Swift.print("✨ newRect:  \(newRect)")
////         svgLayer.bounds =
////         Swift.print("newSize:  \(newSize)")
////      }
////      Swift.print("layer:  \(layer)")
////      Swift.print("newRect:  \(newRect)")
////      svgGraphic.frame = newRect
////      Swift.print("svgGraphic.layer.frame:  \(svgGraphic.layer.frame)")
////      Swift.print("svgGraphic.layer.bounds:  \(svgGraphic.layer.bounds)")
////      Swift.print("svgGraphic.bounds:  \(svgGraphic.bounds)")
////      Swift.print("svgGraphic.frame:  \(svgGraphic.frame)")
//
//
////      Swift.print("data.count:  \(data.count)")
////      Swift.print("content:  \(content)")
////      let svgData = try? Data(contentsOf: URL.init(string: svgURL.path)!)
////      Swift.print("svgData.count:  \(svgData?.count)")
////      var newRect: CGRect = .zero
////      var layer: SVGLayer?
//
//
////      Swift.print(Self.content(Bundle.main.resourcePath! + "/Assets.bundle/shopify.svg"))//Output: testing✌️
////      Swift.print("svgURL:  \(svgURL)")
////      Swift.print("svgURL.absoluteString:  \(svgURL.absoluteString)")
//// try absolute URL, try passing Data?
//
//
//// Set the fill color
////         svgLayer.fillColor = UIColor(red:0.94, green:0.37, blue:0.00, alpha:1.00).cgColor
//// Aspect fit the layer to self.view
////         svgLayer.resizeToFit(self.view.bounds)
//// Add the layer to self.view's sublayers
////
//
//
//
////      svgGraphic.anchorAndSize(to: self, width: self.iconSize.width, height: self.iconSize.height, align: .centerCenter, alignTo: .centerCenter, sizeOffset: .zero)
