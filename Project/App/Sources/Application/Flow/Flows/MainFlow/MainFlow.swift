import UIKit
import RxSwift
import RxRelay
import RxFlow

final class MainFlow: Flow {
    enum TabIndex : Int{
        case home = 0
        case rank = 1
        case mypage = 2
    }
    
    var root: Presentable {
        return rootViewController
    }
    private let homeFlow: HomeFlow = .init()
    private let rankFlow: RankFlow = .init()
    private let mypageFlow: MypageFlow = .init()
    
    private let rootViewController = UITabBarController()
        .builder
        .with {
            $0.tabBar.backgroundColor = .white
            $0.tabBar.tintColor = .red
        }.build

    // MARK: - Deinitalizer
    deinit {
        print("\(type(of: self)): \(#function)")
    }

    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? AppStep else { return .none }
        switch step {
        case .mainTabbarIsRequired:
            return coordinateToMainTabBar()
        default:
            return .none
        }
    }
}

extension MainFlow {
    private func coordinateToMainTabBar() -> FlowContributors {
        Flows.use(
            homeFlow, rankFlow, mypageFlow,
            when: .created
        ) { [unowned self] (root1 : UINavigationController,
                            root2 : UINavigationController,
                            root3 : UINavigationController)  in
            
            let homeItem = UITabBarItem(title: "Home", image: UIImage(named: "Home"), selectedImage: nil)
            let rankItem = UITabBarItem(title: "Rank", image: UIImage(named: "Rank"), selectedImage: nil)
            let mypageItem = UITabBarItem(title: "Mypage", image: UIImage(named: "Mypage"), selectedImage: nil)
            root1.tabBarItem = homeItem
            root2.tabBarItem = rankItem
            root3.tabBarItem = mypageItem
            
            self.rootViewController.setViewControllers([root1, root2, root3], animated: true)
        }
        
        return .multiple(flowContributors: [
            .contribute(withNextPresentable: homeFlow, withNextStepper: homeFlow.stepper),
            .contribute(withNextPresentable: rankFlow, withNextStepper: rankFlow.stepper),
            .contribute(withNextPresentable: mypageFlow, withNextStepper: mypageFlow.stepper)
        ])
    }
}
