// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Firebase",
  platforms: [.iOS(.v11), .macOS(.v10_12), .tvOS(.v12), .watchOS(.v7)],
  products: [
    .library(
      name: "FirebaseABTesting",
      targets: ["FirebaseABTestingTarget"]
    ),
    .library(
      name: "FirebaseAnalytics",
      targets: ["FirebaseAnalyticsTarget"]
    ),
    .library(
      name: "FirebaseAnalyticsOnDeviceConversion",
      targets: ["FirebaseAnalyticsOnDeviceConversionTarget"]
    ),
    .library(
      name: "FirebaseAppCheck",
      targets: ["FirebaseAppCheckTarget"]
    ),
    .library(
      name: "FirebaseAppDistribution",
      targets: ["FirebaseAppDistributionTarget"]
    ),
    .library(
      name: "FirebaseAuth",
      targets: ["FirebaseAuthTarget"]
    ),
    .library(
      name: "FirebaseCrashlytics",
      targets: ["FirebaseCrashlyticsTarget"]
    ),
    .library(
      name: "FirebaseDatabase",
      targets: ["FirebaseDatabaseTarget"]
    ),
    .library(
      name: "FirebaseDynamicLinks",
      targets: ["FirebaseDynamicLinksTarget"]
    ),
    .library(
      name: "FirebaseFirestore",
      targets: ["FirebaseFirestoreTarget"]
    ),
    .library(
      name: "FirebaseFunctions",
      targets: ["FirebaseFunctionsTarget"]
    ),
    .library(
      name: "FirebaseInAppMessaging",
      targets: ["FirebaseInAppMessagingTarget"]
    ),
    .library(
      name: "FirebaseMLModelDownloader",
      targets: ["FirebaseMLModelDownloaderTarget"]
    ),
    .library(
      name: "FirebaseMessaging",
      targets: ["FirebaseMessagingTarget"]
    ),
    .library(
      name: "FirebasePerformance",
      targets: ["FirebasePerformanceTarget"]
    ),
    .library(
      name: "FirebaseRemoteConfig",
      targets: ["FirebaseRemoteConfigTarget"]
    ),
    .library(
      name: "FirebaseStorage",
      targets: ["FirebaseStorageTarget"]
    ),
    .library(
      name: "Google-Mobile-Ads-SDK",
      targets: ["Google-Mobile-Ads-SDKTarget"]
    ),
    .library(
      name: "GoogleSignIn",
      targets: ["GoogleSignInTarget"]
    )
  ],
  dependencies: [
  ],
  targets: [
    .target(
      name: "Firebase",
      publicHeadersPath: "./"
    ),
    .target(
      name: "FirebaseABTestingTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseABTesting"
      ],
      path: "Sources/FirebaseABTesting"
    ),
    .target(
      name: "FirebaseAnalyticsTarget",
      dependencies: [
        "Firebase",
        "_FBLPromises",
        "_FirebaseAnalytics",
        "_FirebaseAnalyticsSwift",
        "_FirebaseCore",
        "_FirebaseCoreInternal",
        "_FirebaseInstallations",
        "_GoogleAppMeasurement",
        "_GoogleAppMeasurementIdentitySupport",
        "_GoogleUtilities",
        "_nanopb"
      ],
      path: "Sources/FirebaseAnalytics"
    ),
    .target(
      name: "FirebaseAnalyticsOnDeviceConversionTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        .target(name: "_FirebaseAnalyticsOnDeviceConversion", condition: .when(platforms: [.iOS])),
        .target(name: "_GoogleAppMeasurementOnDeviceConversion", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/FirebaseAnalyticsOnDeviceConversion"
    ),
    .target(
      name: "FirebaseAppCheckTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseAppCheck"
      ],
      path: "Sources/FirebaseAppCheck"
    ),
    .target(
      name: "FirebaseAppDistributionTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        .target(name: "_FirebaseAppDistribution", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/FirebaseAppDistribution"
    ),
    .target(
      name: "FirebaseAuthTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseAuth",
        "_GTMSessionFetcher"
      ],
      path: "Sources/FirebaseAuth"
    ),
    .target(
      name: "FirebaseCrashlyticsTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseCrashlytics",
        "_GoogleDataTransport"
      ],
      path: "Sources/FirebaseCrashlytics",
      exclude: [
        "run",
        "upload-symbols"
      ]
    ),
    .target(
      name: "FirebaseDatabaseTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseDatabase",
        "_FirebaseDatabaseSwift",
        "_FirebaseSharedSwift",
        "_leveldb-library"
      ],
      path: "Sources/FirebaseDatabase"
    ),
    .target(
      name: "FirebaseDynamicLinksTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        .target(name: "_FirebaseDynamicLinks", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/FirebaseDynamicLinks"
    ),
    .target(
      name: "FirebaseFirestoreTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_BoringSSL-GRPC",
        "_FirebaseCoreExtension",
        "_FirebaseFirestore",
        "_FirebaseFirestoreSwift",
        "_FirebaseSharedSwift",
        "_Libuv-gRPC",
        "_abseil",
        "_gRPC-C++",
        "_gRPC-Core",
        "_leveldb-library"
      ],
      path: "Sources/FirebaseFirestore",
      exclude: [
        "Resources"
      ]
    ),
    .target(
      name: "FirebaseFunctionsTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseAppCheckInterop",
        "_FirebaseAuthInterop",
        "_FirebaseCoreExtension",
        "_FirebaseFunctions",
        "_FirebaseMessagingInterop",
        "_FirebaseSharedSwift",
        "_GTMSessionFetcher"
      ],
      path: "Sources/FirebaseFunctions"
    ),
    .target(
      name: "FirebaseInAppMessagingTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseABTesting",
        .target(name: "_FirebaseInAppMessaging", condition: .when(platforms: [.iOS])),
        .target(name: "_FirebaseInAppMessagingSwift", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/FirebaseInAppMessaging",
      exclude: [
        "Resources"
      ]
    ),
    .target(
      name: "FirebaseMLModelDownloaderTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseMLModelDownloader",
        "_GoogleDataTransport",
        "_SwiftProtobuf"
      ],
      path: "Sources/FirebaseMLModelDownloader"
    ),
    .target(
      name: "FirebaseMessagingTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseMessaging",
        "_GoogleDataTransport"
      ],
      path: "Sources/FirebaseMessaging"
    ),
    .target(
      name: "FirebasePerformanceTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseABTesting",
        .target(name: "_FirebasePerformance", condition: .when(platforms: [.iOS, .tvOS])),
        "_FirebaseRemoteConfig",
        "_GoogleDataTransport"
      ],
      path: "Sources/FirebasePerformance"
    ),
    .target(
      name: "FirebaseRemoteConfigTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseABTesting",
        "_FirebaseRemoteConfig",
        "_FirebaseRemoteConfigSwift",
        "_FirebaseSharedSwift"
      ],
      path: "Sources/FirebaseRemoteConfig"
    ),
    .target(
      name: "FirebaseStorageTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseAppCheckInterop",
        "_FirebaseAuthInterop",
        "_FirebaseCoreExtension",
        "_FirebaseStorage",
        "_GTMSessionFetcher"
      ],
      path: "Sources/FirebaseStorage"
    ),
    .target(
      name: "Google-Mobile-Ads-SDKTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        .target(name: "_GoogleMobileAds", condition: .when(platforms: [.iOS])),
        .target(name: "_UserMessagingPlatform", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/Google-Mobile-Ads-SDK"
    ),
    .target(
      name: "GoogleSignInTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        .target(name: "_AppAuth", condition: .when(platforms: [.iOS])),
        .target(name: "_GTMAppAuth", condition: .when(platforms: [.iOS])),
        "_GTMSessionFetcher",
        .target(name: "_GoogleSignIn", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/GoogleSignIn",
      exclude: [
        "Resources"
      ]
    ),
    .binaryTarget(
      name: "_AppAuth",
      path: "xcframework/_AppAuth.xcframework.zip"
    ),
    .binaryTarget(
      name: "_BoringSSL-GRPC",
      path: "xcframework/_BoringSSL-GRPC.xcframework.zip"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      path: "xcframework/_FBLPromises.xcframework.zip"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      path: "xcframework/_FirebaseABTesting.xcframework.zip"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      path: "xcframework/_FirebaseAnalytics.xcframework.zip"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsOnDeviceConversion",
      path: "xcframework/_FirebaseAnalyticsOnDeviceConversion.xcframework.zip"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsSwift",
      path: "xcframework/_FirebaseAnalyticsSwift.xcframework.zip"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      path: "xcframework/_FirebaseAppCheck.xcframework.zip"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      path: "xcframework/_FirebaseAppCheckInterop.xcframework.zip"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      path: "xcframework/_FirebaseAppDistribution.xcframework.zip"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      path: "xcframework/_FirebaseAuth.xcframework.zip"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      path: "xcframework/_FirebaseAuthInterop.xcframework.zip"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      path: "xcframework/_FirebaseCore.xcframework.zip"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      path: "xcframework/_FirebaseCoreExtension.xcframework.zip"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      path: "xcframework/_FirebaseCoreInternal.xcframework.zip"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      path: "xcframework/_FirebaseCrashlytics.xcframework.zip"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      path: "xcframework/_FirebaseDatabase.xcframework.zip"
    ),
    .binaryTarget(
      name: "_FirebaseDatabaseSwift",
      path: "xcframework/_FirebaseDatabaseSwift.xcframework.zip"
    ),
    .binaryTarget(
      name: "_FirebaseDynamicLinks",
      path: "xcframework/_FirebaseDynamicLinks.xcframework.zip"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      path: "xcframework/_FirebaseFirestore.xcframework.zip"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreSwift",
      path: "xcframework/_FirebaseFirestoreSwift.xcframework.zip"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      path: "xcframework/_FirebaseFunctions.xcframework.zip"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      path: "xcframework/_FirebaseInAppMessaging.xcframework.zip"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessagingSwift",
      path: "xcframework/_FirebaseInAppMessagingSwift.xcframework.zip"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      path: "xcframework/_FirebaseInstallations.xcframework.zip"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      path: "xcframework/_FirebaseMLModelDownloader.xcframework.zip"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      path: "xcframework/_FirebaseMessaging.xcframework.zip"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      path: "xcframework/_FirebaseMessagingInterop.xcframework.zip"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      path: "xcframework/_FirebasePerformance.xcframework.zip"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      path: "xcframework/_FirebaseRemoteConfig.xcframework.zip"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigSwift",
      path: "xcframework/_FirebaseRemoteConfigSwift.xcframework.zip"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      path: "xcframework/_FirebaseSharedSwift.xcframework.zip"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      path: "xcframework/_FirebaseStorage.xcframework.zip"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      path: "xcframework/_GTMAppAuth.xcframework.zip"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      path: "xcframework/_GTMSessionFetcher.xcframework.zip"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      path: "xcframework/_GoogleAppMeasurement.xcframework.zip"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      path: "xcframework/_GoogleAppMeasurementIdentitySupport.xcframework.zip"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementOnDeviceConversion",
      path: "xcframework/_GoogleAppMeasurementOnDeviceConversion.xcframework.zip"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      path: "xcframework/_GoogleDataTransport.xcframework.zip"
      ),
    .binaryTarget(
      name: "_GoogleMobileAds",
      path: "xcframework/_GoogleMobileAds.xcframework.zip"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      path: "xcframework/_GoogleSignIn.xcframework.zip"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      path: "xcframework/_GoogleUtilities.xcframework.zip"
    ),
    .binaryTarget(
      name: "_Libuv-gRPC",
      path: "xcframework/_Libuv-gRPC.xcframework.zip"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      path: "xcframework/_SwiftProtobuf.xcframework.zip"
    ),
    .binaryTarget(
      name: "_UserMessagingPlatform",
      path: "xcframework/_UserMessagingPlatform.xcframework.zip"
    ),
    .binaryTarget(
      name: "_abseil",
      path: "xcframework/_abseil.xcframework.zip"
    ),
    .binaryTarget(
      name: "_gRPC-C++",
      path: "xcframework/_gRPC-C++.xcframework.zip"
    ),
    .binaryTarget(
      name: "_gRPC-Core",
      path: "xcframework/_gRPC-Core.xcframework.zip"
    ),
    .binaryTarget(
      name: "_leveldb-library",
      path: "xcframework/_leveldb-library.xcframework.zip"
    ),
    .binaryTarget(
      name: "_nanopb",
      path: "xcframework/_nanopb.xcframework.zip"
    )
  ]
)
    
