import Foundation
import ReactorKit
import RxSwift
import RxRelay
import RxFlow

final class CreateReactor: Reactor, Stepper {
    
    private let disposeBag: DisposeBag = .init()
    var steps: PublishRelay<Step> = .init()

    //MARK: - Reactor
    enum Action {
        case buttonDidTap
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
extension CreateReactor {
    func mutate(action: Action) -> Observable<Mutation> {
         switch action {
         case .buttonDidTap:
             steps.accept(AppStep.dismiss)
         }
        return .empty()
    }
}

//MARK: - reduce
extension CreateReactor {
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
         switch mutation {
             
         }
        return newState
    }
}
