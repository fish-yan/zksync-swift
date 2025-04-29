// swift-tools-version:5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ZKSync",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "ZKSync",
            targets: [
                "ZKSync"
            ]),
    ],
    dependencies: [
        .package(url: "https://github.com/web3swift-team/web3swift.git", .upToNextMajor(from: "3.3.0")),
        .package(url: "https://github.com/Alamofire/Alamofire.git", from: "5.6.3"),
        .package(url: "https://github.com/mxcl/PromiseKit.git", .upToNextMajor(from: "8.2.0")),
    ],
    targets: [
        .target(
            name: "ZKSync",
            dependencies: [
                "ZKSyncCrypto",
                "web3swift",
                "Alamofire",
                "PromiseKit"
            ],
            path: "Sources/ZKSync"),
        .binaryTarget(
            name: "ZKSyncCrypto",
            path: "Dependencies/ZKSyncCrypto.xcframework"),
    ]
)
