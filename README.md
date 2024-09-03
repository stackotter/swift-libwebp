## swift-libwebp

A basic Swift wrapper for libwebp. This package builds libwebp from source, meaning that it doesn't
rely on any system packages being installed.

### Usage

#### Decoding

```swift
import Foundation
import WebP

let url = URL(fileURLWithPath: "image.webp")
let bytes = [UInt8](try Data(contentsOf: url))
let image = try WebP.decode(bytes)

let topLeftPixel = (image.rgba[0], image.rgba[1], image.rgba[2], image.rgba[3])
print("width = \(image.width), height = \(image.height)")
print("pixel @ (0, 0) = \(topLeftPixel)")
```

#### Encoding

```swift
import Foundation
import WebP

let image = WebP(
    width: ...,
    height: ...,
    rgba: ...
)
let bytes = try image.encode(quality: 50)

let url = URL(fileURLWithPath: "out.webp")
try Data(bytes).write(to: url)
```
