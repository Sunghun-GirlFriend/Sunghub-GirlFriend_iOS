import ProjectDescription
import UtilityPlugin

private let setting: Settings = .settings(
    base: Environment.baseSetting,
    configurations: [
        .debug(name: .debug),
        .release(name: .release)
    ],
    defaultSettings: .recommended()
)

private let target: [Target] = [
    Target(
        name: Environment.appName,
        platform: Environment.platform,
        product: .app,
        bundleId: "\(Environment.organizationName).\(Environment.targetName)",
        infoPlist: .file(path: "Project/App/Support/Info.plist"),
        sources: ["Project/App/Sources/**"],
        resources: ["Project/App/Resources/**"],
        scripts: Environment.targetScript,
        dependencies: [
            .SPM.Moya,
            .SPM.IQKeyboardManager,
            .SPM.ReactorKit,
            .SPM.RxFlow,
            .SPM.SnapKit,
            .SPM.RxCocoa,
            .SPM.Swinject
        ] ,
        settings: .settings(base: Environment.baseSetting)
    ),
    Target(
        name: Environment.targetTestName,
        platform: Environment.platform,
        product: .unitTests,
        bundleId: "\(Environment.organizationName).\(Environment.targetName)Tests",
        infoPlist: .default,
        sources: ["Project/App/Tests/**"],
        dependencies: [
            .target(name: Environment.targetName)
        ]
    ),
    Target(
        name: Environment.targetUITestName,
        platform: Environment.platform,
        product: .uiTests,
        bundleId: "\(Environment.organizationName).\(Environment.targetName)UITests",
        infoPlist: .default,
        sources: ["Project/App/UITests/**"],
        dependencies: [
            .target(name: Environment.targetName)
        ]
    )
]

private let scheme: [Scheme] = [
    Scheme(
        name: "\(Environment.targetName)-DEBUG",
        shared: true,
        buildAction: .buildAction(targets: ["\(Environment.targetName)"]),
        testAction: TestAction.targets(
            ["\(Environment.targetTestName)"],
            configuration: .debug,
            options: TestActionOptions.options(
                coverage: true,
                codeCoverageTargets: ["\(Environment.targetName)"]
            )
        ),
        runAction: .runAction(configuration: .debug),
        archiveAction: .archiveAction(configuration: .debug),
        profileAction: .profileAction(configuration: .debug),
        analyzeAction: .analyzeAction(configuration: .debug)
    ),
    Scheme(
        name: "\(Environment.targetName)-RELEASE",
        shared: true,
        buildAction: BuildAction(targets: ["\(Environment.targetName)"]),
        testAction: nil,
        runAction: .runAction(configuration: .release),
        archiveAction: .archiveAction(configuration: .release),
        profileAction: .profileAction(configuration: .release),
        analyzeAction: .analyzeAction(configuration: .release)
    )
]

public extension Project {
    static func makeApplication() -> Project {
        return Project(
            name: Environment.appName,
            organizationName: Environment.organizationName,
            settings: setting,
            targets: target,
            schemes: scheme
        )
    }
}
