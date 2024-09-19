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
        .package(name: "GoogleMobileAds", url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git", .exact("11.2.0"))
    ],
    targets: [
        .binaryTarget(
            name: "OMSDK_Microsoft",
            url:
                "https://adsdkprod.azureedge.net/mobile/ios/releases/9.0.0/dynamic/OMSDK_Microsoft.zip",
            checksum: "aa8b19113ffaa1548bc40f9c8ea26037e6b09e28629deff086f50ce4ee79bd6c"
        ),
         .binaryTarget(
            name: "AppNexusSDKTarget",
            url:
                "https://adsdkprod.azureedge.net/mobile/ios/releases/9.0.0/dynamic/AppNexusSDKDynamic.zip",
            checksum: "460fb3ff228e16689a93b524c185628f26d98ee3544d7ef3f5ddb36ad62684a7"
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
      url: "https://acdn.adnxs.com/mobile/mtest/SwiftPM/2/ANGoogleAdapter.xcframework.zip",
     checksum: "28d95ce9b682550b86db0537d82cf518b3d5c285dd5f905fb401af7956189e7e"
    )
    ]
)

