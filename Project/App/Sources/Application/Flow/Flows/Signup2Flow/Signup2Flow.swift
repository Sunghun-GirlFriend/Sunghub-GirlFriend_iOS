import UIKit
import RxSwift
import RxRelay
import RxFlow

struct Signup2Stepper: Stepper {
    var steps: PublishRelay<Step> = .init()
    var initialStep: Step {
        return AppStep.signup2IsRequired
    }
}

final class Signup2Flow: Flow {
    var root: Presentable {
        return rootViewController
    }
    let stepper: Signup2Stepper = .init()
    private let rootViewController = UINavigationController()

    // MARK: - Deinitalizer
    deinit {
        print("\(type(of: self)): \(#function)")
    }

    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? AppStep else { return .none }
        switch step {
        case .signup2IsRequired:
            return coodrinatorToSignUp2()
        case .signup3IsRequired:
            return navigateToSignup2()
        default:
            return .none
        }
    }
}

extension Signup2Flow {
    func coodrinatorToSignUp2() -> FlowContributors {
        let viewController = AppDelegate.container.resolve(Signup2ViewController.self)!
        self.rootViewController.setViewControllers([viewController], animated: true)
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
