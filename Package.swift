// swift-tools-version:5.3

import PackageDescription

let sdkVersion = "9.15.0"
let baseUrl = "https://adsdk.bing.net/mobile/ios/releases"

let sdkChecksum = """
b248f1f7ed542b4ffacf886accac526500dc4d373b5193b9596f29643a167474
"""

let package = Package(
    name: "AppNexusSDK",

    defaultLocalization: "en",

    platforms: [
        .iOS(.v12)
    ],

    products: [
        .library(
            name: "AppNexusSDK",
            targets: [
                "AppNexusSDKTarget"
            ]
        )
    ],

    targets: [
        .binaryTarget(
            name: "AppNexusSDKTarget",
            url: "\(baseUrl)/\(sdkVersion)/static/AppNexusSDK.zip",
            checksum: sdkChecksum
        )
    ]
)
