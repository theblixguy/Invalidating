// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Invalidating",
  platforms: [
    .iOS(.v11),
    .tvOS(.v11),
    .macOS(.v10_11),
  ],
  products: [
    .library(
      name: "Invalidating",
      targets: ["Invalidating"]),
  ],
  dependencies: [],
  targets: [
    .target(
      name: "Invalidating",
      dependencies: []),
    .testTarget(
      name: "InvalidatingTests",
      dependencies: ["Invalidating"]),
  ],
  swiftLanguageVersions: [.v5]
)
