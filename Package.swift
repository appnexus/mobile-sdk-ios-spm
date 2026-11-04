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
            checksum: "399181b6663b04a23dbe24f9c65347dd68b4002dae312f5d22a96fa3f903a079"
        ),
         .binaryTarget(
            name: "AppNexusSDKTarget",
            url:
                "https://adsdk.bing.net/mobile/ios/releases/9.15.0/dynamic/AppNexusSDKDynamic.zip",
            checksum: "b7d918d74c6d96feeb14590a3d9f9298a5e071673cc1c94b05f1da6dbb3dc3f0"
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
      url: "https://adsdk.bing.net/mobile/ios/releases/9.15.0/static/ANGoogleAdapter.zip",
     checksum: "d96874a8a7085ef78b5ff771f7065ddad69d0f17cab2bb0ada8f496d013721f1"
    )
    ]
)
