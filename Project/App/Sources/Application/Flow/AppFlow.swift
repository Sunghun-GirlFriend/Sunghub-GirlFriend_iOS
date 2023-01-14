import UIKit
import RxRelay
import RxSwift
import RxFlow

struct AppStepper: Stepper {
    let steps: PublishRelay<Step> = .init()
    private let disposeBag = DisposeBag()
    func readyToEmitSteps() {
        steps.accept(AppStep.signinIsRequired)
    }
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
        case .signinIsRequired:
            return coordinateToSignIn()
        case .createIsRequired:
            return coordinateToCreate()
        case .signupIsRequired:
            return coordinateToSignup()
        case .mainTabbarIsRequired:
            return coordinateToMainTabbar()
        default:
            return .none
        }
    }
}

extension AppFlow {
    private func coordinateToSignIn() -> FlowContributors {
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

    private func coordinateToSignup() -> FlowContributors {
        let flow = SignupFlow()
        Flows.use(flow, when: .created) { [unowned self] root in
            rootWindow.rootViewController = root
        }
        return .one(flowContributor:
                .contribute(
                    withNextPresentable: flow,
                    withNextStepper: OneStepper(withSingleStep: AppStep.signupIsRequired
                )
            )
        )
    }

    private func coordinateToMainTabbar() -> FlowContributors {
        let flow = MainFlow()
        Flows.use(flow, when: .created) { [unowned self] root in
            rootWindow.rootViewController = root
        }
        return .one(flowContributor:
                .contribute(
                    withNextPresentable: flow,
                    withNextStepper: OneStepper(withSingleStep: AppStep.mainTabbarIsRequired
                )
            )
        )
    }

    private func coordinateToCreate() -> FlowContributors {
        let flow = CreateFlow()
        Flows.use(flow, when: .created) { [unowned self] root in
            rootWindow.rootViewController = root
        }
        return .one(flowContributor:
                .contribute(
                    withNextPresentable: flow,
                    withNextStepper: OneStepper(withSingleStep: AppStep.createIsRequired
                )
            )
        )
    }
}
