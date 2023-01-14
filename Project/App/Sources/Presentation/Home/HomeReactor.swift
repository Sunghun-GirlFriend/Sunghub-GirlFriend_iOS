import Foundation
import ReactorKit
import RxSwift
import RxRelay
import RxFlow

final class HomeReactor: Reactor , Stepper{
    
    private let disposeBag: DisposeBag = .init()
    var steps: PublishRelay<Step> = .init()

    //MARK: - Reactor
    enum Action {
       case buttonAction
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
extension HomeReactor {
    func mutate(action: Action) -> Observable<Mutation> {
         switch action {
         case .buttonAction:
             steps.accept(AppStep.createIsRequired)
             return .empty()
         }
    }
}

//MARK: - reduce
extension HomeReactor {
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        // switch mutation {
        // }
        return newState
    }
}
