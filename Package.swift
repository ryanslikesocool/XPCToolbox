// swift-tools-version: 6.0

import PackageDescription

let package = Package(
	name: "XPCToolbox",
	defaultLocalization: "en",
	platforms: [
		.iOS(.v17),
		.macCatalyst(.v13),
		.macOS(.v10_13),
		.tvOS(.v17),
		.watchOS(.v10),
		.visionOS(.v2),
	],
	products: [
		.library(name: "XPCToolbox", targets: ["XPCToolbox"]),
	],
	targets: [
		.target(name: "XPCToolbox"),
	]
)
