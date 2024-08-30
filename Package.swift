// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "Beethoven",
    dependencies: [
        .package(url: "https://github.com/vadymmarkov/Pitchy.git", from: "2.0.0"),
    ],
    targets: [
        .target(
            name: "Beethoven",
            dependencies: [
                // Add your dependencies here
            ]
        ),
        .testTarget(
            name: "BeethovenTests",
            dependencies: ["Beethoven"]
        ),
    ]
)
