// swift-tools-version:5.2
import PackageDescription

let package = Package(
    name: "SVGWrapper",
    products: [
        .library(
            name: "SVGWrapper",
            targets: ["SVGWrapper"]),
    ],
    dependencies: [
        .package(url: "https://github.com/mchoe/SwiftSVG", .upToNextMajor(from: "2.3.2"))
    ],
    targets: [
        .target(
            name: "SVGWrapper",
            dependencies: []),
        .testTarget(
            name: "SVGWrapperTests",
            dependencies: ["SVGWrapper"]),
    ]
)
