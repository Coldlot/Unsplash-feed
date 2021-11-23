import ProjectDescription

let linting = TargetScript.post(
    path: "swiftlint-phase.sh",
    arguments: [],
    name: "SwiftLint"
)

let target = Target(
    name: "Unsplash-feed",
    platform: .iOS,
    product: .app,
    bundleId: "com.coldlot.Unsplash-feed",
    deploymentTarget: .iOS(targetVersion: "15.0", devices: .iphone),
    infoPlist: "Unsplash-feed/Info.plist",
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
    targets: [target]
)
