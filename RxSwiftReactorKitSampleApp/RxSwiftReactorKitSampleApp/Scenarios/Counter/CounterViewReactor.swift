//
//  CounterViewReactor.swift
//  RxSwiftReactorKitSampleApp
//
//  Created by Clint on 24/12/2018.
//  Copyright © 2018 clintjang. All rights reserved.
//

import Foundation

final class ReactorViewReactor: Reactor {

    enum Action {
        case temp
    }

    struct State {
        var isTemp: Bool = false
    }

    let initialState = State()
}
