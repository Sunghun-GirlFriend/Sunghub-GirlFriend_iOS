import UIKit
import RxSwift
import RxRelay
import RxFlow

struct HomeStepper: Stepper {
    let steps: PublishRelay<Step> = .init()
    var initialStep: Step {
        return AppStep.HomeIsRequired
    }
}

final class HomeFlow: Flow {
    var root: Presentable {
        return rootViewController
    }
    let stepper: HomeStepper = .init()
    private let rootViewController = UINavigationController()

    // MARK: - Deinitalizer
    deinit {
        print("\(type(of: self)): \(#function)")
    }

    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? AppStep else { return .none }
        switch step {
        case.HomeIsRequired:
            return coordinateToHome()
        default:
            return .none
        }
    }
}

private extension HomeFlow {
    func coordinateToHome() -> FlowContributors {
        let viewcontroller = AppDelegate.container.resolve(HomeViewController.self)!
        self.rootViewController.setViewControllers([viewcontroller], animated: true)
        return .one(flowContributor: .contribute(
            withNextPresentable: viewcontroller,
            withNextStepper: viewcontroller.reactor!)
        )
    }
}
