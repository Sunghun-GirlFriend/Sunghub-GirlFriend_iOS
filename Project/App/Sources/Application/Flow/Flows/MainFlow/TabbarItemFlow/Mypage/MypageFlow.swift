import UIKit
import RxSwift
import RxRelay
import RxFlow

struct MypageStepper: Stepper {
    let steps: PublishRelay<Step> = .init()
    var initialStep: Step {
        return AppStep.MypageIsRequired
    }
}

final class MypageFlow: Flow {
    var root: Presentable {
        return rootViewController
    }
    let stepper: MypageStepper = .init()
    private let rootViewController = UINavigationController()

    // MARK: - Deinitalizer
    deinit {
        print("\(type(of: self)): \(#function)")
    }

    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? AppStep else { return .none }
        switch step {
        case .MypageIsRequired:
            return coordinateToMypage()
        default:
            return .none
        }
    }
}

private extension MypageFlow {
    func coordinateToMypage() -> FlowContributors {
        let viewController = AppDelegate.container.resolve(MyPageViewController.self)!
        self.rootViewController.setViewControllers([viewController], animated: true)
        return .one(flowContributor: .contribute(
            withNextPresentable: viewController,
            withNextStepper: viewController.reactor!)
        )
    }
}
