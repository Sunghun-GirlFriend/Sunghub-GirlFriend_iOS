import Foundation
import ReactorKit
import RxSwift
import RxRelay
import RxFlow


class SignupReactor: Reactor, Stepper {
    
    private let disposeBag: DisposeBag = .init()
    var steps: PublishRelay<Step> = .init()

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
    
    func mutate(action: Action) -> Observable<Mutation> {
        // switch action {
        // }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        // switch mutation {
        // }
        return newState
    }
    
}
