//
//  MainViewReactor.swift
//  RxSwiftReactorKitSampleApp
//
//  Created by Clint on 03/12/2018.
//  Copyright © 2018 clintjang. All rights reserved.
//

final class MainViewReactor: Reactor {

    enum Action {
        case temp
    }

    struct State {
        var isTemp: Bool = false
    }

    let initialState = State()
}
