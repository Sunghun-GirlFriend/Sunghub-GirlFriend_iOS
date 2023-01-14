import RxFlow

public enum AppStep: Step {
    case dismiss
    
    case signinIsRequired
    case signupIsRequired
    case mainIsRequired
}
