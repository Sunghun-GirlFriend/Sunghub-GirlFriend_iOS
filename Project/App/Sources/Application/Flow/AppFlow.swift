import UIKit
import RxRelay
import RxSwift
import RxFlow

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
        guard let step = step as? AppStep else { return .none }
        switch step {
        default:
            return .none
        }
    }
}

extension AppFlow {
    private func coordinateToOnBoarding() -> FlowContributors {
        let flow = SignInFlow()
        Flows.use(flow, when: .created) { [unowned self] root in
            rootWindow.rootViewController = root
        }
        return .one(flowContributor:
                .contribute(
                    withNextPresentable: flow,
                    withNextStepper: OneStepper(withSingleStep: AppStep.signinIsRequired
                )
            )
        )
    }

    private func coordinateToMain() -> FlowContributors {
        let flow = MainFlow()
        Flows.use(flow, when: .created) { [unowned self] root in
            rootWindow.rootViewController = root
        }
        return .one(flowContributor:
                .contribute(
                    withNextPresentable: flow,
                    withNextStepper: OneStepper(withSingleStep: AppStep.mainIsRequired
                )
            )
        )
    }
}
