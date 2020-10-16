// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "Font",
    platforms: [
        .macOS(.v10_15), .iOS(.v13), .watchOS(.v6)
    ],
    products: [
        .library(name: "CommonFont", targets: ["CommonFont"]),
        .library(name: "Font", targets: ["Font"])
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "Font",
            dependencies: ["CommonFont"],
            resources:[
                .copy("Resources/Ionicon/ionicons.ttf"),
                .copy("Resources/FontAwesome/fa-brands-400.ttf"),
                .copy("Resources/FontAwesome/fa-regular-400.ttf"),
                .copy("Resources/FontAwesome/fa-solid-900.ttf"),
            ]),
        .target(
            name: "CommonFont",
            dependencies: []),
        .testTarget(
            name: "FontTests",
            dependencies: ["Font"]),
        .testTarget(
            name: "CommonFontTests",
            dependencies: ["CommonFont"]),
    ]
)
