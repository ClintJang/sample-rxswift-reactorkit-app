//
//  SettingViewReactor.swift
//  RxSwiftReactorKitSampleApp
//
//  Created by Clint on 03/12/2018.
//  Copyright © 2018 clintjang. All rights reserved.
//

final class SettingViewReactor: Reactor {

    enum Action {
        case Temp
    }

    struct State {
        var temp: String = "Temp"
    }

    let initialState = State()
}
