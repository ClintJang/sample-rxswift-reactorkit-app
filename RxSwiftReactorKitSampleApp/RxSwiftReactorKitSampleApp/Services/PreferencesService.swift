//
//  PreferencesService.swift
//  RxSwiftReactorKitSampleApp
//
//  Created by Clint on 19/12/2018.
//  Copyright © 2018 clintjang. All rights reserved.
//

import Foundation

protocol HasPreferencesService {
    var preferencesService: PreferencesService { get }
}

struct UserPreferences {
    private init () {}

    static let onBoarded = "onBoarded"
}

class PreferencesService {
    func setOnboarding () {
        let defaults = UserDefaults.standard
        defaults.set(true, forKey: UserPreferences.onBoarded)
    }

    func isOnboarded () -> Bool {
        let defaults = UserDefaults.standard
        return defaults.bool(forKey: UserPreferences.onBoarded)
    }
}
