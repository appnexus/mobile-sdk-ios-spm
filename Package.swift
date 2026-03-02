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
                "https://adsdkprod.azureedge.net/mobile/ios/releases/9.11.1/dynamic/OMSDK_Microsoft.zip",
            checksum: "789a73a1dad92507aa8b600fc769adf1b8c372798af7e49b97d1ae27e50b0e81"
        ),
         .binaryTarget(
            name: "AppNexusSDKTarget",
            url:
                "https://adsdkprod.azureedge.net/mobile/ios/releases/9.11.1/dynamic/AppNexusSDKDynamic.zip",
            checksum: "3e62cf43ceb5fcf4b6698616e95268148f45b17e07f852d31637c59315dae43d"
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
      url: "https://adsdkprod.azureedge.net/mobile/ios/releases/9.11.1/static/ANGoogleAdapter.zip",
     checksum: "b89a83638b369d53a143f6cd3205e6028818553dffadbaa1a876395d68bcb890"
    )
    ]
)
