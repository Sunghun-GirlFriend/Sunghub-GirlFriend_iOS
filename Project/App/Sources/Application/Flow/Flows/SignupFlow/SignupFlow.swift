import UIKit
import RxSwift
import RxRelay
import RxFlow

struct SignupStepper: Stepper {
    var steps: PublishRelay<Step> = .init()
    var initialStep: Step {
        return AppStep.signupIsRequired
    }
}

final class SignupFlow: Flow {
    var root: Presentable {
        return rootViewController
    }
    let stepper: SignupStepper = .init()
    private let rootViewController = UINavigationController()

    // MARK: - Deinitalizer
    deinit {
        print("\(type(of: self)): \(#function)")
    }

    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? AppStep else { return .none }
        switch step {
        case .signupIsRequired:
            return coodrinatorToSignUp()
        case .signup2IsRequired:
            return navigateToSignup()
        case .signup3IsRequired:
            return navigateToSignup2()
        default:
            return .none
        }
    }
}

extension SignupFlow {
    func coodrinatorToSignUp() -> FlowContributors {
        let viewController = AppDelegate.container.resolve(SignupViewController.self)!
        self.rootViewController.setViewControllers([viewController], animated: true)
        return .one(flowContributor: .contribute(
            withNextPresentable: viewController,
            withNextStepper: viewController.reactor!)
        )
    }

    func navigateToSignup() -> FlowContributors {
        let viewController = AppDelegate.container.resolve(Signup2ViewController.self)!
               self.rootViewController.pushViewController(viewController, animated: true)
               return .one(flowContributor: .contribute(
                   withNextPresentable: viewController,
                   withNextStepper: viewController.reactor!)
               )
    }
    func navigateToSignup2() -> FlowContributors {
        let viewController = AppDelegate.container.resolve(Signup3ViewController.self)!
               self.rootViewController.pushViewController(viewController, animated: true)
               return .one(flowContributor: .contribute(
                   withNextPresentable: viewController,
                   withNextStepper: viewController.reactor!)
               )
    }
}

