// swift-tools-version:5.3

import PackageDescription

let sdkVersion = "9.12.1"
let baseUrl = "https://adsdk.bing.net/mobile/ios/releases"

let sdkChecksum = """
9de8a0bac5d31311c279bbd562bba19e4810cf77d22acc9606a9e59b66698929
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
