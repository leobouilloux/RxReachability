// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RxReachability",
    platforms: [
        .macOS(.v10_10),
        .iOS(.v11),
        .tvOS(.v11)
    ],
    products: [
        .library(
            name: "RxReachability",
            type: .dynamic,
            targets: ["RxReachability"])
    ],
    dependencies: [
        .package(url: "https://github.com/ReactiveX/RxSwift", .upToNextMajor(from: "6.0.0")),
        .package(
            name: "Reachability",
            url: "https://github.com/ashleymills/Reachability.swift",
            .upToNextMajor(from: "5.1.0")
        )
    ],
    targets: [
        .target(
            name: "RxReachability",
            dependencies: [
                "RxSwift", "Reachability",
                .product(name: "RxCocoa", package: "RxSwift")
        ]),

        // MARK: SwiftPM tests
        .testTarget(
            name: "RxReachabilityTests",
            dependencies: [
            "RxReachability",
            .product(name: "RxBlocking", package: "RxSwift")
            ]),
    ]
)
