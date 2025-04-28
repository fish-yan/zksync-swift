// swift-tools-version:5.3
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
        .package(url: "https://github.com/fish-yan/web3swift.git", .branch("userop")),
        .package(
            name: "Alamofire",
            url: "https://github.com/Alamofire/Alamofire.git",
            from: "5.4.3"
        ),
        .package(url: "https://github.com/mxcl/PromiseKit.git", .upToNextMajor(from: "8.2.0")),
    ],
    targets: [
        .target(
            name: "ZKSync",
            dependencies: [
                "ZKSyncCrypto",
                .product(name: "web3swift", package: "Web3swift"),
                "Alamofire",
                "PromiseKit"
            ],
            path: "Sources/ZKSync"),
        .binaryTarget(
            name: "ZKSyncCrypto",
            path: "Dependencies/ZKSyncCrypto.xcframework"),
    ]
)
