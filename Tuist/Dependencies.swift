import ProjectDescription
import UtilityPlugin

let dependencies = Dependencies(
    carthage: [],
    swiftPackageManager: [
        .Swinject,
        .SnapKit,
        .RxFlow,
        .RxSwift,
        .ReactorKit,
        .IQKeyboardManager,
        .Moya
    ],
    platforms: [.iOS]
)
