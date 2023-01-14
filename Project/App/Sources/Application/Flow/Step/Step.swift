import RxFlow

public enum AppStep: Step {
    case dismiss
    
    case signinIsRequired
    case signupIsRequired
    case mainTabbarIsRequired
    
    //MARK: - Tabbar
    case HomeIsRequired
    case RankIsRequired
    case MypageIsRequired
}
