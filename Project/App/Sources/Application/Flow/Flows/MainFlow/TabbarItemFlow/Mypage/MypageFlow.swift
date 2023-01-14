import UIKit
import RxSwift
import RxRelay
import RxFlow

struct MypageStepper: Stepper {
    let steps: PublishRelay<Step> = .init()
    var initialStep: Step {
        return AppStep.HomeIsRequired
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
        default:
            return .none
        }
    }
}
