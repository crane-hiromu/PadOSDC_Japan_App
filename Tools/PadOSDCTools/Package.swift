// swift-tools-version:5.6
import PackageDescription

let package = Package(
    name: "PadOSDCTools",
    platforms: [
        .macOS(.v12),
    ],
    dependencies: [
        .package(url: "https://github.com/SwiftGen/SwiftGen", from: "6.6.2"),
        .package(url: "https://github.com/mono0926/LicensePlist", from: "3.22.4"),
    ],
    targets: [.target(name: "PadOSDCTools", path: "")]
)
