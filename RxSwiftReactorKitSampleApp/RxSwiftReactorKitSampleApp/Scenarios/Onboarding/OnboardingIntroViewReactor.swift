//
//  OnboardingIntroViewReactor.swift
//  RxSwiftReactorKitSampleApp
//
//  Created by Clint on 30/12/2018.
//  Copyright © 2018 clintjang. All rights reserved.
//

import Foundation

final class OnboardingIntroViewReactor: Reactor, HasPreferencesService {
    let preferencesService = PreferencesService()

    enum Action {
        case introIsComplete
    }

    enum Mutation {
        case moveDashboard
    }

    struct State {
        var step: Step = SampleStep.intro
    }

    let initialState = State()

    func mutate(action: OnboardingIntroViewReactor.Action) -> Observable<OnboardingIntroViewReactor.Mutation> {
        switch action {
        case .introIsComplete:
            preferencesService.setOnboarding()
            return Observable.just(Mutation.moveDashboard)
        }
    }

    func reduce(state: OnboardingIntroViewReactor.State, mutation: OnboardingIntroViewReactor.Mutation) -> OnboardingIntroViewReactor.State {
        var state = state
        switch mutation {
        case .moveDashboard:
            state.step = SampleStep.introIsComplete
            return state
        }
    }
}
