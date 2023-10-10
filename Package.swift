// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Tiktoken",
    platforms: [.macOS(.v14), .iOS(.v17), .tvOS(.v13), .watchOS(.v6)],
    products: [
        .library(
            name: "Tiktoken",
            targets: ["Tiktoken"]),
    ],
    dependencies: [
		.package(url: "https://github.com/apple/swift-crypto.git", .upToNextMajor(from: "2.5.0")),
    ],
    targets: [
        .target(
            name: "Tiktoken",
            dependencies: [
				.product(name: "Crypto", package: "swift-crypto"),
			]
		),
        .testTarget(
            name: "TiktokenTests",
            dependencies: ["Tiktoken"]),
    ]
)
