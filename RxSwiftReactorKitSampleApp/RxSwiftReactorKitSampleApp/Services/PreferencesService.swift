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
}

class PreferencesService {

}
