//
//  SettingFlow.swift
//  RxSwiftReactorKitSampleApp
//
//  Created by Clint on 24/12/2018.
//  Copyright © 2018 clintjang. All rights reserved.
//

import Foundation

final class SettingFlow: Flow {
    var root: Presentable {
        return self.rootViewController
    }

    private let rootViewController = UINavigationController()
    private let services: AppServices

    init(withServices services: AppServices) {
        self.services = services
    }

    deinit {
        log.info("\(type(of: self)): \(#function)")
    }

    func navigate(to step: Step) -> FlowContributors {

        guard let step = step as? SampleStep else { return FlowContributors.none }

        switch step {

        case .settingIsRequired:
            return navigateToSettingScreen()
        default:
            return FlowContributors.none
        }
    }

    private func navigateToSettingScreen() -> FlowContributors {
        let viewController = SettingViewController.instantiate()
        viewController.title = "Setting"

        self.rootViewController.pushViewController(viewController, animated: true)
        return .one(flowContributor: .contribute(withNextPresentable: viewController, withNextStepper: OneStepper(withSingleStep: SampleStep.settingIsRequired)))
    }
}
