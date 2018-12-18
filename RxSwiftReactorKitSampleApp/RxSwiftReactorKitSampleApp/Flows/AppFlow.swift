//
//  AppFlow.swift
//  RxSwiftReactorKitSampleApp
//
//  Created by Clint on 19/12/2018.
//  Copyright © 2018 clintjang. All rights reserved.
//

import UIKit

class AppFlow: Flow {

    var root: Presentable {
        return self.rootWindow
    }

    private let rootWindow: UIWindow
    private let services: AppServices

    init(withWindow window: UIWindow, andServices services: AppServices) {
        self.rootWindow = window
        self.services = services
    }

    deinit {
        print("\(type(of: self)): \(#function)")
    }

    func navigate(to step: Step) -> NextFlowItems {
        guard let step = step as? SampleStep else { return NextFlowItems.none }

        switch step {
        case .onboarding, .dashboard:
            fallthrough
        default:
            return NextFlowItems.none
        }
    }

}

class AppStepper: Stepper {
    init(withServices services: AppServices) {
        self.step.accept(SampleStep.onboarding)
    }
}
