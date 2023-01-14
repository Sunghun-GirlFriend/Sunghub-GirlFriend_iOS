import UIKit
import RxRelay
import RxSwift
import RxFlow
import BaseFeature

struct AppStepper: Stepper {
    let steps: PublishRelay<Step> = .init()
    private let disposeBag = DisposeBag()
    func readyToEmitSteps() {}
}

final class AppFlow: Flow {
    // MARK: - Properties
    var root: Presentable {
        return self.rootWindow
    }
    private let rootWindow: UIWindow

    // MARK: - Initalizer
    init(_ rootWindow: UIWindow) {
        self.rootWindow = rootWindow
    }

    // MARK: - Deinitalizer
    deinit {
        print("\(type(of: self)) : \(#function)")
    }
    func navigate(to step: RxFlow.Step) -> RxFlow.FlowContributors {
        guard let step = step as? FritzStep else { return .none }
        switch step {
        default:
            return .none
        }
    }
}
extension AppFlow {}
