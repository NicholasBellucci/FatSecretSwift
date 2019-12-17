// swift-tools-version:4.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FatSecretSwift",
    products: [
        .library(
            name: "FatSecretSwift",
            targets: ["FatSecretSwift"]),
    ],
    dependencies: [
        .package(url: "https://github.com/krzyzanowskim/CryptoSwift.git", from: "1.3.0")
    ],
    targets: [
        .target(
            name: "FatSecretSwift",
            dependencies: ["CryptoSwift"]),
        .testTarget(
            name: "FatSecretSwiftTests",
            dependencies: ["FatSecretSwift"]),
    ]
)
