//
//  SignupReactorView.swift
//  Godsang-iOS
//
//  Created by sunghun on 2023/01/14.
//  Copyright © 2023 Sunghun-GirlFriend. All rights reserved.
//

import Foundation
import ReactorKit
import RxSwift

class SignupReactor: Reactor {
    
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
