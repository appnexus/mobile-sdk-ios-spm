// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AppNexusSDK",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v15)
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
                "https://adsdk.bing.net/mobile/ios/releases/9.15.0/dynamic/OMSDK_Microsoft.zip",
            checksum: "ecaa79657e52be55d498701a6bacc2154fb426303d4bd567466a2cb22714301a"
        ),
         .binaryTarget(
            name: "AppNexusSDKTarget",
            url:
                "https://adsdk.bing.net/mobile/ios/releases/9.15.0/dynamic/AppNexusSDKDynamic.zip",
            checksum: "6a458f2aebf13da97c0f67ef7f224ea310555e602a5ccd1358ed191d8537f60d"
        ),
      .target(
         name: "ANGoogleMobileAdsTarget",
      dependencies: [
        .target(name: "ANGoogleMobileAds"),
        .target(name: "AppNexusSDKTarget"),
        .product(name: "GoogleMobileAds", package: "GoogleMobileAds")
      ],
      path: "ANGoogleMobileAdsTarget",
      publicHeadersPath: "."
    ),
    .binaryTarget(
      name: "ANGoogleMobileAds",
      url: "https://adsdk.bing.net/mobile/ios/releases/9.15.0/static/ANGoogleAdapter.zip",
     checksum: "45b80c760080ce2c003703c5d79c9a3ab0a4d488c5f7e82627fb692935a14ed0"
    )
    ]
)
