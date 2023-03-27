// swift-tools-version: 5.6
import PackageDescription

let package = Package(
    name: "SVGWrapper",
    platforms: [.iOS(.v13), .macOS(.v10_15)], // update to ios15? 
    products: [
        .library(
            name: "SVGWrapper",
            targets: ["SVGWrapper"])
    ],
    dependencies: [
        /* Should probably lock to current version */
        .package(path: "../SwiftDraw")
        // .package(url: "https://github.com/swhitty/SwiftDraw.git", .upToNextMajor(from: "0.8.0"))
    ],
    targets: [
        .target(
            name: "SVGWrapper",
            dependencies: ["SwiftDraw"])
    ]
)
