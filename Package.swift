// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "OpenKeyboardKit",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v15),
        .macOS(.v12),
        .tvOS(.v16),
        .watchOS(.v8),
        .visionOS(.v1)
    ],
    products: [
        .library(
            name: "OpenKeyboardKit",
            targets: ["OpenKeyboardKit"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/danielsaidi/EmojiKit.git", exact: "1.7.1"),
        .package(url: "https://github.com/danielsaidi/GestureButton.git", exact: "0.5.0"),
        .package(url: "https://github.com/SimplyDanny/SwiftLintPlugins", exact: "0.65.0")
    ],
    targets: [
        .target(
            name: "OpenKeyboardKit",
            dependencies: ["EmojiKit", "GestureButton"],
            resources: [.process("Resources")]
        ),
        .testTarget(
            name: "OpenKeyboardKitTests",
            dependencies: ["OpenKeyboardKit"]
        )
    ]
)
