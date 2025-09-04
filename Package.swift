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
                "https://adsdkprod.azureedge.net/mobile/ios/releases/9.8.0/dynamic/OMSDK_Microsoft.zip",
            checksum: "702e995acded092e04622c1bfef90f32282312ca87fe4029aa06edfe57d993d7"
        ),
         .binaryTarget(
            name: "AppNexusSDKTarget",
            url:
                "https://adsdkprod.azureedge.net/mobile/ios/releases/9.8.0/dynamic/AppNexusSDKDynamic.zip",
            checksum: "2c6e991690342575d652bfd48b7d4f7b7920c5be6adea620962e27e0e95af1fb"
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
      url: "https://adsdkprod.azureedge.net/mobile/ios/releases/9.8.0/static/ANGoogleAdapter.zip",
     checksum: "53ca4b678bf35c1ac5d2898f8b4b3be5fafa6edec4716935df1e7a07f1870759"
    )
    ]
)
