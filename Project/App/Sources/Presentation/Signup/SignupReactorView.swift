import Foundation
import ReactorKit
import RxSwift
import RxRelay
import RxFlow

final class SignupReactor: Reactor, Stepper {

    private let disposeBag: DisposeBag = .init()
    var steps: PublishRelay<Step> = .init()

    enum Action {
        case completeButtonDidTap
        case signupButtonDidTap
    }
    
    enum Mutation {
        // mutation cases
    }
    
    struct State {
        //state
    }
    
    let initialState: State
    
    init() {
        self.initialState = State()
    }
    
    func mutate(action: Action) -> Observable<Mutation> {
         switch action {
         case .completeButtonDidTap:
             steps.accept(AppStep.signup2IsRequired)
         case .signupButtonDidTap:
             steps.accept(AppStep.signup3IsRequired)
         }
        return .empty()
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
         switch mutation {
         }
        return newState
    }
    
}
