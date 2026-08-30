// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "PDFArchiverWebsite",
    platforms: [
        .macOS(.v13)
    ],
    products: [
        .executable(name: "PDFArchiverWebsite", targets: ["PDFArchiverWebsite"])
    ],
    dependencies: [
        .package(url: "https://github.com/johnsundell/publish.git", from: "0.9.0")
    ],
    targets: [
        .executableTarget(
            name: "PDFArchiverWebsite",
            dependencies: [
                .product(name: "Publish", package: "publish")
            ]
        )
    ]
)
