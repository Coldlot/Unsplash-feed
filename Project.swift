import ProjectDescription

let linting = TargetScript.post(
    path: "swiftlint-phase.sh",
    arguments: [],
    name: "SwiftLint"
)

let plist = InfoPlist.dictionary([
    "CFBundleDevelopmentRegion": .string("$(DEVELOPMENT_LANGUAGE)"),
    "CFBundleExecutable": .string("$(EXECUTABLE_NAME)"),
    "CFBundleIdentifier": .string("$(PRODUCT_BUNDLE_IDENTIFIER)"),
    "CFBundleInfoDictionaryVersion": .string("6.0"),
    "CFBundleName": .string("$(PRODUCT_NAME)"),
    "CFBundlePackageType": .string("$(PRODUCT_BUNDLE_PACKAGE_TYPE)"),
    "CFBundleShortVersionString": .string("1.0"),
    "CFBundleVersion": .string("1"),
    "LSRequiresIPhoneOS": .boolean(true),
    "UISupportedInterfaceOrientations": .array([
        "UIInterfaceOrientationPortrait"
    ]),
    "UILaunchStoryboardName": .string("LaunchScreen"),
    "UIAppFonts": .array([
        .string("Roboto-Bold.ttf"),
        .string("Roboto-Regular.ttf")
    ]),
//FIXME: - Switch project to the new Lifecycle
//    "UIApplicationSceneManifest": .dictionary([
//        "UIApplicationSupportsMultipleScenes": .boolean(false),
//        "UISceneConfigurations": .dictionary([
//            "UIWindowSceneSessionRoleApplication": .array([
//                .dictionary([
//                    "UISceneConfigurationName": .string("Default Configuration"),
//                    "UISceneDelegateClassName": .string("$(PRODUCT_MODULE_NAME).SceneDelegate"),
//                    "UILaunchStoryboardName": .string("LaunchScreen"),
//                ])
//            ])
//        ])
//    ]),
    "UIRequiredDeviceCapabilities": .array([
        "armv7"
    ])
])

let target = Target(
    name: "Unsplash-feed",
    platform: .iOS,
    product: .app,
    bundleId: "com.coldlot.Unsplash-feed",
    deploymentTarget: .iOS(targetVersion: "15.0", devices: .iphone),
    infoPlist: plist,
    sources: ["Unsplash-feed/**"],
    resources: [
        "Unsplash-feed/Resources/**",
        "Unsplash-feed/**/*.storyboard"
    ],
    scripts: [linting],
    dependencies: [
        .package(product: "SnapKit"),
        .package(product: "RxSwift"),
        .package(product: "RxCocoa"),
        .package(product: "Swinject")
    ],
    settings: Settings.settings(
        configurations: [
            .debug(
                name: "Debug"
            ),
            .release(
                name: "Release",
                settings: SettingsDictionary()
                    .bitcodeEnabled(true)
                    .swiftCompilationMode(.wholemodule)
            )
        ]
    )
)

let project = Project(
    name: "Unsplash-feed",
    packages: [
        .remote(
            url: "https://github.com/ReactiveX/RxSwift.git",
            requirement: .upToNextMajor(from: "6.2.0")
        ),
        .remote(
            url: "https://github.com/SnapKit/SnapKit.git",
            requirement: .upToNextMajor(from: "5.0.1")
        ),
        .remote(
            url: "https://github.com/Swinject/Swinject.git",
            requirement: .upToNextMajor(from: "2.8.1")
        )
    ],
    targets: [target],
    schemes: [
        Scheme(
            name: "Unsplash-feed(Debug)",
            shared: true,
            buildAction: .buildAction(targets: ["Unsplash-feed"]),
            //TODO: Add Tests
//            testAction: .targets(["AppTests"]),
            runAction: .runAction(executable: "Unsplash-feed")
        ),
        Scheme(
            name: "Unsplash-feed(Release)",
            shared: true,
            buildAction: .buildAction(targets: ["Unsplash-feed"]),
            runAction: .runAction(executable: "Unsplash-feed")
        )
    ]
)
