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
    enum TabIndex : Int{
        case home = 0
        case rank = 1
        case mypage = 2
    }
    
    var root: Presentable {
        return rootViewController
    }
    let stepper: MainStepper = .init()
    private let rootViewController = UITabBarController()
        .builder
        .with {
            $0.tabBar.backgroundColor = .white
        }.build

    // MARK: - Deinitalizer
    deinit {
        print("\(type(of: self)): \(#function)")
    }

    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? AppStep else { return .none }
        switch step {
        case .mainIsRequired:
            return .none
        default:
            return .none
        }
    }
}

