import UIKit
import RxSwift
import RxRelay
import RxFlow

struct MainStepper: Stepper {
    var steps: PublishRelay<Step> = .init()
    var initialStep: Step {
        return AppStep.mainIsRequired
    }
}

final class MainFlow: Flow {
    var root: Presentable {
        return rootViewController
    }
    let stepper: MainStepper = .init()
    private let rootViewController = UINavigationController()

    // MARK: - Deinitalizer
    deinit {
        print("\(type(of: self)): \(#function)")
    }

    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? AppStep else { return .none }
        switch step {
        case .mainIsRequired:
            return coodrinatorToMain()
        default:
            return .none
        }
    }
}

extension MainFlow {
    func coodrinatorToMain() -> FlowContributors {
        return .none
    }
}
