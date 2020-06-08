// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "swift-server",
    dependencies: [
   	.package(name: "PerfectHTTPServer", url: "https://github.com/PerfectlySoft/Perfect-HTTPServer.git", from: "3.0.0") 
    ],
    targets: [
        .target(
            name: "swift-server",
            dependencies: ["PerfectHTTPServer"]),
        .testTarget(
            name: "swift-serverTests",
            dependencies: ["swift-server"]),
    ]
)
