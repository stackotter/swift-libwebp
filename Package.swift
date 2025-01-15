// swift-tools-version:5.7

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
                "libwebp",
                "sharpyuv",
                "imageioutil",
            ]
        ),
        .target(
            name: "libwebp",
            dependencies: [],
            path: "libwebp/src",
            publicHeadersPath: ".",
            cSettings: [
                .headerSearchPath("../.")
            ]
        ),
        .target(
            name: "imageioutil",
            dependencies: [
                .target(name: "libwebp")
            ],
            path: "libwebp",
            exclude: [
                "cmake",
                "doc",
                "examples",
                "extras",
                "gradle",
                "infra",
                "m4",
                "man",
                "sharpyuv",
                "src",
                "swig",
                "tests",
                "webp_js",
            ],
            publicHeadersPath: ".",
            cSettings: [
                .headerSearchPath("../.")
            ]
        ),
        .target(
            name: "sharpyuv",
            dependencies: [
                .target(name: "libwebp")
            ],
            path: "libwebp",
            exclude: [
                "cmake",
                "doc",
                "examples",
                "extras",
                "gradle",
                "imageio",
                "infra",
                "m4",
                "man",
                "src",
                "swig",
                "tests",
                "webp_js",
            ],
            publicHeadersPath: ".",
            cSettings: [
                .headerSearchPath("../.")
            ]
        ),
        .testTarget(
            name: "WebPTests",
            dependencies: ["WebP"],
            resources: [.copy("fjord.webp")]
        ),
    ]
)
