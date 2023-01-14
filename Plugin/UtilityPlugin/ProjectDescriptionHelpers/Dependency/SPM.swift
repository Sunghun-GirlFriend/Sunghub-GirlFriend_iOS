import ProjectDescription

public extension TargetDependency.SPM {
    static let Moya = TargetDependency.external(name: "Moya")
    static let SnapKit = TargetDependency.external(name: "SnapKit")
    static let Swinject = TargetDependency.external(name: "Swinject")
    static let RxSwift = TargetDependency.external(name: "RxSwift")
    static let RxCocoa = TargetDependency.external(name: "RxCocoa")
    static let ReactorKit = TargetDependency.external(name: "ReactorKit")
    static let RxFlow = TargetDependency.external(name: "RxFlow")
    static let IQKeyboardManager = TargetDependency.external(name: "IQKeyboardManagerSwift")
}

public extension Package {
    static let Moya = Package.remote(url: "https://github.com/Moya/Moya", requirement: .exact("15.0.3"))
    static let Swinject = Package.remote(url: "https://github.com/Swinject/Swinject", requirement: .exact("2.8.3"))
    static let SnapKit = Package.remote(url: "https://github.com/SnapKit/SnapKit.git", requirement: .exact("5.6.0"))
    static let RxSwift = Package.remote(url: "https://github.com/ReactiveX/RxSwift.git", requirement: .exact("6.5.0"))
    static let ReactorKit = Package.remote(url: "https://github.com/ReactorKit/ReactorKit.git", requirement: .exact("3.2.0"))
    static let RxFlow = Package.remote(url: "https://github.com/RxSwiftCommunity/RxFlow.git", requirement: .exact("2.13.0"))
    static let IQKeyboardManager = Package.remote(url: "https://github.com/hackiftekhar/IQKeyboardManager.git", requirement: .exact("6.5.0"))
}
