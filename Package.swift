// swift-tools-version:5.3

import PackageDescription

let sdkVersion = "9.12.2"
let baseUrl = "https://adsdk.bing.net/mobile/ios/releases"

let sdkChecksum = """
0c9abeaae6db78df5d0295d855528d05b8b7998e48455b0078df903aa957b2ed
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
