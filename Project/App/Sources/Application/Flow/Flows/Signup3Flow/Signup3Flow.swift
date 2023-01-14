import UIKit
import RxSwift
import RxRelay
import RxFlow

struct Signup3Stepper: Stepper {
    var steps: PublishRelay<Step> = .init()
    var initialStep: Step {
        return AppStep.signup3IsRequired
    }
}

final class Signup3Flow: Flow {
    var root: Presentable {
        return rootViewController
    }
    let stepper: Signup3Stepper = .init()
    private let rootViewController = UINavigationController()

    // MARK: - Deinitalizer
    deinit {
        print("\(type(of: self)): \(#function)")
    }

    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? AppStep else { return .none }
        switch step {
        case .signup3IsRequired:
            return coodrinatorToSignUp3()
        case .signinIsRequired:
            return navigateToSignin()
        default:
            return .none
        }
    }
}

extension Signup3Flow {
    func coodrinatorToSignUp3() -> FlowContributors {
        let viewController = AppDelegate.container.resolve(Signup3ViewController.self)!
        self.rootViewController.setViewControllers([viewController], animated: true)
        return .one(flowContributor: .contribute(
            withNextPresentable: viewController,
            withNextStepper: viewController.reactor!)
        )
    }

    func navigateToSignin() -> FlowContributors {
        let viewController = AppDelegate.container.resolve(SignInViewController.self)!
        self.rootViewController.setViewControllers([viewController], animated: true)
        return .one(flowContributor: .contribute(
            withNextPresentable: viewController,
            withNextStepper: viewController.reactor!)
        )
    }
}

