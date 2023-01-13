// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let package = Package(
    name: "Font",
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "Font",
            targets: ["Font"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "Font",
            dependencies: [],
            resources: [
                .copy("Resources/FontAwesome/fa-brands-400.ttf"),
                .copy("Resources/FontAwesome/fa-regular-400.ttf"),
                .copy("Resources/FontAwesome/fa-solid-900.ttf"),
                .copy("Resources/Ionicons/ionicons.ttf"),
            ]
        ),
        .testTarget(
            name: "FontTests",
            dependencies: ["Font"]
        ),
    ]
)