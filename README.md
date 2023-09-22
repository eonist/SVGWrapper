[![Tests](https://github.com/eonist/SVGWrapper/actions/workflows/Tests.yml/badge.svg)](https://github.com/eonist/SVGWrapper/actions/workflows/Tests.yml)

# SVGWrapper

[![Tests](https://github.com/eonist/SVGWrapper/actions/workflows/Tests.yml/badge.svg)](https://github.com/eonist/SVGWrapper/actions/workflows/Tests.yml)

SVGWrapper is a lightweight Swift library for rendering SVG images in macOS and iOS apps. It provides an easy-to-use API for loading and displaying SVG images, with support for custom foreground and background colors.

## Usage

To use SVGWrapper in your project, simply add it to your project's dependencies:

```swift
dependencies: [
    .package(url: "https://github.com/eonist/SVGWrapper.git", branch: "main")
]
```

Then, import the module and create an `SVGImageView` instance with the URL of the SVG file you want to load:

```swift
import SVGWrapper

let svgURLStr: String = Bundle.main.resourcePath! + "/Assets.bundle/user.svg"
let imageView: SVGImageView = .init(url: svgURLStr)
```

You can also customize the foreground and background colors of the SVG image:

```swift
let imageView: SVGImageView = .init(url: svgURLStr, foregroundColor: .red, backgroundColor: .systemGreen)
```

## Contributing

Contributions to SVGWrapper are welcome and encouraged! If you find a bug or have a feature request, please open an issue or submit a pull request.

### Todo:

- Rename project to SVGGraphic? or keep as is?
- Remove test target, we don't have tests yet
 