import Foundation
import ReactorKit
import RxSwift
import RxRelay
import RxFlow

final class SignUpReactor: Reactor, Stepper {
    
    private let disposeBag: DisposeBag = .init()
    var steps: PublishRelay<Step> = .init()

    //MARK: - Reactor
    enum Action {
        // actiom cases
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
extension SignUpReactor {
    func mutate(action: Action) -> Observable<Mutation> {
        // switch action {
        // }
    }
}

//MARK: - reduce
extension SignUpReactor {
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        // switch mutation {
        // }
        return newState
    }
}
