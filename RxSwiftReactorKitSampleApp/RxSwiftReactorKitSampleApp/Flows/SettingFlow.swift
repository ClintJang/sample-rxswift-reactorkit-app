//
//  SettingFlow.swift
//  RxSwiftReactorKitSampleApp
//
//  Created by Clint on 24/12/2018.
//  Copyright © 2018 clintjang. All rights reserved.
//

import Foundation

class SettingFlow: Flow {
    var root: Presentable {
        return self.rootViewController
    }

    private let rootViewController = UINavigationController()
    private let services: AppServices

    init(withServices services: AppServices) {
        self.services = services
    }

    deinit {
        print("\(type(of: self)): \(#function)")
    }

    func navigate(to step: Step) -> NextFlowItems {

        guard let step = step as? SampleStep else { return NextFlowItems.none }

        switch step {

        case .setting:
            return navigateToSettingScreen()
        default:
            return NextFlowItems.none
        }
    }

    private func navigateToSettingScreen() -> NextFlowItems {
        let viewController = SettingViewController.instantiate()
        viewController.title = "Setting"

        self.rootViewController.pushViewController(viewController, animated: true)
        return .one(flowItem: NextFlowItem(nextPresentable: viewController,
                                           nextStepper: OneStepper(withSingleStep: SampleStep.setting)))
    }
}
