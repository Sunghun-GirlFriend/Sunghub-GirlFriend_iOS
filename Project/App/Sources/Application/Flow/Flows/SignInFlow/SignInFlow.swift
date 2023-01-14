import UIKit
import RxSwift
import RxRelay
import RxFlow

struct SignInStepper: Stepper {
    var steps: PublishRelay<Step> = .init()
    var initialStep: Step {
        return AppStep.signinIsRequired
    }
}

final class SignInFlow: Flow {
    var root: Presentable {
        return rootViewController
    }
    let stepper: SignInStepper = .init()
    private let rootViewController = UINavigationController()

    // MARK: - Deinitalizer
    deinit {
        print("\(type(of: self)): \(#function)")
    }

    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? AppStep else { return .none }
        switch step {
        case .signinIsRequired:
            return coodrinatorToSignIn()
        case .signupIsRequired:
            return navigateToSignUp()
        case .popToRoot:
            return popToRoot()
        default:
            return .none
        }
    }
}

extension SignInFlow {
    func coodrinatorToSignIn() -> FlowContributors {
        let viewController = AppDelegate.container.resolve(SignInViewController.self)!
        self.rootViewController.setViewControllers([viewController], animated: true)
        return .one(flowContributor: .contribute(
            withNextPresentable: viewController,
            withNextStepper: viewController.reactor!)
        )
    }
    
    func navigateToSignUp() -> FlowContributors {
        let viewController = AppDelegate.container.resolve(SignupViewController.self)!
        self.rootViewController.pushViewController(viewController, animated: true)
        return .one(flowContributor: .contribute(
            withNextPresentable: viewController,
            withNextStepper: viewController.reactor!)
        )
    }
    
    func popToRoot() -> FlowContributors {
        self.rootViewController.popToRootViewController(animated: true)
        return .none
    }
}
