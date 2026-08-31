// swift-tools-version:5.3

import PackageDescription

let sdkVersion = "9.14.0"
let baseUrl = "https://adsdk.bing.net/mobile/ios/releases"

let sdkChecksum = """
bdef7e73428edf73da7cc7b7480ce9a5eda385c3249a9a67466e3f6ed9371bff
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
