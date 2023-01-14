import UIKit
import RxSwift
import RxRelay
import RxFlow

struct CreateStepper: Stepper {
    var steps: PublishRelay<Step> = .init()
    var initialStep: Step {
        return AppStep.createIsRequired
    }
}

final class CreateFlow: Flow {
    var root: Presentable {
        return rootViewController
    }
    let stepper: CreateStepper = .init()
    private let rootViewController = UINavigationController()

    // MARK: - Deinitalizer
    deinit {
        print("\(type(of: self)): \(#function)")
    }

    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? AppStep else { return .none }
        switch step {
        case .createIsRequired:
            return coodrinatorToSignIn()
        case .dismiss:
            return dismiss()
        default:
            return .none
        }
    }
}

extension CreateFlow {
    func coodrinatorToSignIn() -> FlowContributors {
        let viewController = AppDelegate.container.resolve(CreateViewController.self)!
        self.rootViewController.setViewControllers([viewController], animated: true)
        return .one(flowContributor: .contribute(
            withNextPresentable: viewController,
            withNextStepper: viewController.reactor!)
        )
    }
    func dismiss() -> FlowContributors {
        self.rootViewController.topViewController?.dismiss(animated: true)
        return .none
    }
}

