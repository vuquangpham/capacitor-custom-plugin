// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "MyCustomPlugin",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "MyCustomPlugin",
            targets: ["MyCustomPluginPlugin"])
    ],
    dependencies: [
        .package(url: "https://github.com/ionic-team/capacitor-swift-pm.git", branch: "main")
    ],
    targets: [
        .target(
            name: "MyCustomPluginPlugin",
            dependencies: [
                .product(name: "Capacitor", package: "capacitor-swift-pm"),
                .product(name: "Cordova", package: "capacitor-swift-pm")
            ],
            path: "ios/Sources/MyCustomPluginPlugin"),
        .testTarget(
            name: "MyCustomPluginPluginTests",
            dependencies: ["MyCustomPluginPlugin"],
            path: "ios/Tests/MyCustomPluginPluginTests")
    ]
)