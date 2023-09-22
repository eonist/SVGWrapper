// swift-tools-version: 5.6
import PackageDescription

let package = Package(
    name: "SVGWrapper", // Package name
    platforms: [.iOS(.v15), .macOS(.v12)], // Supported platforms
    // Define a product named "SVGWrapper"
    // The product is a library
    // The library name is "SVGWrapper"
    // The target name is "SVGWrapper"
    products: [
        .library(
            name: "SVGWrapper", // Library name
            targets: ["SVGWrapper"]) // Target name
    ],
    dependencies: [
        /* Should probably lock to current version */
        .package(path: "../SwiftDraw") // Local package dependency
        // .package(url: "https://github.com/swhitty/SwiftDraw.git", .upToNextMajor(from: "0.8.0"))
    ],
    // Define the target named "SVGWrapper"
    // It depends on the "SwiftDraw" package
    // The target name is "SVGWrapper"
    targets: [
        .target(
            name: "SVGWrapper", // Target name
            dependencies: ["SwiftDraw"]) // Dependency name
    ]
)
