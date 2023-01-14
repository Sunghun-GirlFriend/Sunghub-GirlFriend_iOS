import RxFlow

public enum AppStep: Step {
    case dismiss
    
    case signinIsRequired
    case signupIsRequired
    case mainIsRequired
    case createIsRequired

    case signup2IsRequired
    case signup3IsRequired
}
