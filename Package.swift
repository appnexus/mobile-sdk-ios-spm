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
                "https://adsdk.bing.net/mobile/ios/releases/9.14.1-beta/dynamic/OMSDK_Microsoft.zip",
            checksum: "29e240f71064e618b4ad07b68cbac398dacf5a6d16ad803e4636bdc6681ec2b0"
        ),
         .binaryTarget(
            name: "AppNexusSDKTarget",
            url:
                "https://adsdk.bing.net/mobile/ios/releases/9.14.1-beta/dynamic/AppNexusSDKDynamic.zip",
            checksum: "fd414b65c46a5bb07dd13ad630d25e56cdf931cbe8b7517a42ba4a62972aa792"
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
      url: "https://adsdk.bing.net/mobile/ios/releases/9.14.1-beta/static/ANGoogleAdapter.zip",
     checksum: "96a623b3b50616532e6c5b0b8e77045e4ba59ca8747cfbe1287666d6a3da5f88"
    )
    ]
)
