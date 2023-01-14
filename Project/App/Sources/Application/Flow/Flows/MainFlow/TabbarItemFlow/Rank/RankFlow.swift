import UIKit
import RxSwift
import RxRelay
import RxFlow

struct RankStepper: Stepper {
    let steps: PublishRelay<Step> = .init()
    var initialStep: Step {
        return AppStep.RankIsRequired
    }
}

final class RankFlow: Flow {
    var root: Presentable {
        return rootViewController
    }
    let stepper: RankStepper = .init()
    private let rootViewController = UINavigationController()

    // MARK: - Deinitalizer
    deinit {
        print("\(type(of: self)): \(#function)")
    }

    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? AppStep else { return .none }
        switch step {
        case .RankIsRequired:
            return coordinateToRank()
        default:
            return .none
        }
    }
}

private extension RankFlow {
    func coordinateToRank() -> FlowContributors {
        let viewController = AppDelegate.container.resolve(RankViewController.self)!
        self.rootViewController.setViewControllers([viewController], animated: true)
        return .one(flowContributor:
                .contribute(
                    withNextPresentable: viewController,
                    withNextStepper: viewController.reactor!)
        )
    }
}
