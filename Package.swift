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
                "https://adsdkprod.azureedge.net/mobile/ios/releases/9.10.1/dynamic/OMSDK_Microsoft.zip",
            checksum: "e5857f8fd6f9a30ba2727bedc67a17e6b3901df4ab95e9a48fbbaefb6c86cbd9"
        ),
         .binaryTarget(
            name: "AppNexusSDKTarget",
            url:
                "https://adsdkprod.azureedge.net/mobile/ios/releases/9.10.1/dynamic/AppNexusSDKDynamic.zip",
            checksum: "1aabde29bd72316f9b46bc60844af65860dec0a7c3adaa059669d1311d20392e"
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
      url: "https://adsdkprod.azureedge.net/mobile/ios/releases/9.10.1/static/ANGoogleAdapter.zip",
     checksum: "d1ebf0cd9dce5ff9780a37534c2294d75918b7c45cef1d01d14886f2acf8e280"
    )
    ]
)
