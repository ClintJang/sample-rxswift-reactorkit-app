//
//  GitHubSearchViewReactor.swift
//  RxSwiftReactorKitSampleApp
//
//  Created by Clint on 04/12/2018.
//  Copyright © 2018 clintjang. All rights reserved.
//

final class GitHubSearchViewReactor: Reactor {

    enum Action {
        case temp
    }

    struct State {
        var temp: String = ""
    }

    let initialState = State()

}
