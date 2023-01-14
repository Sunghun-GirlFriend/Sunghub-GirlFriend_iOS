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
        default:
            return .none
        }
    }
}
