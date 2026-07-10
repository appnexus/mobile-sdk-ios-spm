// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

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
                "OMSDK_Microsoft",
                "AppNexusSDKTarget"
            ]
        ),
        .library(
            name: "ANGoogleAdapter",
            targets: [
               "ANGoogleMobileAdsTarget"
            ]
        ),
    ],
     dependencies: [
        .package(name: "GoogleMobileAds", url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git", .exact("12.8.0"))
    ],
    targets: [
        .binaryTarget(
            name: "OMSDK_Microsoft",
            url:
                "https://adsdk.bing.net/mobile/ios/releases/9.12.2/dynamic/OMSDK_Microsoft.zip",
            checksum: "0312eb7a746dc60084402f3d865e11c32a2a3ce918ff16a4975c4a846da0dfb4"
        ),
         .binaryTarget(
            name: "AppNexusSDKTarget",
            url:
                "https://adsdk.bing.net/mobile/ios/releases/9.12.2/dynamic/AppNexusSDKDynamic.zip",
            checksum: "74e29f86905fd272a7777a55ceb78a3e7f05e2d9daed124f2eac6459b1e01bdd"
        ),
      .target(
         name: "ANGoogleMobileAdsTarget",
      dependencies: [
        .target(name: "ANGoogleMobileAds"),
        .target(name: "AppNexusSDKTarget"),
        .product(name: "GoogleMobileAds", package: "GoogleMobileAds")
      ],
      path: "ANGoogleMobileAdsTarget"
    ),
    .binaryTarget(
      name: "ANGoogleMobileAds",
      url: "https://adsdk.bing.net/mobile/ios/releases/9.12.2/static/ANGoogleAdapter.zip",
     checksum: "e0279bb418aa8f69e784de48ae7ff2668f71bfbcf37c0d087c8eac8d092e44cd"
    )
    ]
)
