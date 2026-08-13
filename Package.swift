// swift-tools-version:5.3

import PackageDescription

let sdkVersion = "9.13.1"
let baseUrl = "https://adsdk.bing.net/mobile/ios/releases"

let sdkChecksum = """
a60cab056eadb3daa8e8aa11ad564cc0736f7cbf6fcdcc6768fbea79e2931da5
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
