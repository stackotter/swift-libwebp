// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "swift-libwebp",
    products: [
        .library(name: "WebP", targets: ["WebP"])
    ],
    targets: [
        .target(
            name: "WebP",
            dependencies: [
                "libwebp"
            ]
        ),
        .target(
            name: "libwebp",
            sources: ["libwebp/src", "libwebp/sharpyuv"],
            publicHeadersPath: "includes",
            cSettings: [.headerSearchPath("libwebp")]
        ),
        .testTarget(
            name: "WebPTests",
            dependencies: ["WebP"]
        ),
    ]
)
