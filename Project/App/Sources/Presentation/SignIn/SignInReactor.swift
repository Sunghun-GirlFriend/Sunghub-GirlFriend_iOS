import Foundation
import ReactorKit
import RxSwift
import RxRelay
import RxFlow

final class SignInReactor: Reactor, Stepper {
    
    private let disposeBag: DisposeBag = .init()
    var steps: PublishRelay<Step> = .init()

    //MARK: - Reactor
    enum Action {
        case loginButtonDidTap
        case idFindButtonDidTap
        case signUpButtonDidTap
        case passwordButtonDidTap
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
}

//MARK: - Mutate
extension SignInReactor {
    func mutate(action: Action) -> Observable<Mutation> {
         switch action {
         case .loginButtonDidTap:
             steps.accept(AppStep.mainIsRequired)
         case .idFindButtonDidTap:
             return .empty()
         case .signUpButtonDidTap:
             return .empty()
         case .passwordButtonDidTap:
             return .empty()
         }
        return .empty()
    }
}

//MARK: - reduce
extension SignInReactor {
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
         switch mutation {
             
         }
        return newState
    }
}
