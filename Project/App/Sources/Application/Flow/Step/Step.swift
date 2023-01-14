import RxFlow

public enum AppStep: Step {
    case dismiss
    case popToRoot
    
    case signinIsRequired
    case signupIsRequired
    case mainIsRequired
    case createIsRequired
    case mainTabbarIsRequired
    case HomeIsRequired
    case RankIsRequired
    case MypageIsRequired

    case signup2IsRequired
    case signup3IsRequired
}
