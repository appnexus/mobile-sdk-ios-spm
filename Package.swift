// swift-tools-version:5.3

import PackageDescription

let sdkVersion = "9.14.1-beta"
let baseUrl = "https://adsdk.bing.net/mobile/ios/releases"

let sdkChecksum = """
7f9090e83f75121afeff65da4a3d9fe0d3d84998d1d4ac57c52a4f7ad857ec9a
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
