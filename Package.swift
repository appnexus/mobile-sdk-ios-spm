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
                "https://adsdk.bing.net/mobile/ios/releases/9.14.0/dynamic/OMSDK_Microsoft.zip",
            checksum: "2cfd8f91d582fea778de20af6b49dd86eb59009b3fd12278d92a4896de5e7645"
        ),
         .binaryTarget(
            name: "AppNexusSDKTarget",
            url:
                "https://adsdk.bing.net/mobile/ios/releases/9.14.0/dynamic/AppNexusSDKDynamic.zip",
            checksum: "225f5e3e0f5bb0d2189c20543140ef2796b100cb052941a52378eafacc7afccc"
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
      url: "https://adsdk.bing.net/mobile/ios/releases/9.14.0/static/ANGoogleAdapter.zip",
     checksum: "c76076b0d3a5b18507e0384cb55d08afb6db677e661b891e67444315b6466fe0"
    )
    ]
)
