// swift-tools-version:5.2
import PackageDescription

let package = Package(
    name: "SVGWrapper",
    platforms: [.iOS(.v13), .macOS(.v10_15)],
    products: [
        .library(
            name: "SVGWrapper",
            targets: ["SVGWrapper"]),
    ],
    dependencies: [
        /* Should probably lock to current version */
        .package(url: "https://github.com/mchoe/SwiftSVG", .upToNextMajor(from: "2.3.2"))
    ],
    targets: [
        .target(
            name: "SVGWrapper",
            dependencies: ["SwiftSVG"]),
        .testTarget(
            name: "SVGWrapperTests",
            dependencies: ["SVGWrapper"]),
    ]
)
