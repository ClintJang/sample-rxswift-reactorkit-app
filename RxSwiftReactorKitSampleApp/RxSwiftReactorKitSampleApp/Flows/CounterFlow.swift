//
//  CounterFlow.swift
//  RxSwiftReactorKitSampleApp
//
//  Created by Clint on 24/12/2018.
//  Copyright © 2018 clintjang. All rights reserved.
//

import UIKit

final class CounterFlow: Flow {
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

        case .counterIsRequired:
            return navigateToCounterScreen()
        default:
            return FlowContributors.none
        }
    }

    private func navigateToCounterScreen() -> FlowContributors {
        let viewController = CounterViewController.instantiate()
        viewController.title = "Counter"

        self.rootViewController.pushViewController(viewController, animated: true)
        return .one(flowContributor: .contribute(withNextPresentable: viewController, withNextStepper: OneStepper(withSingleStep: SampleStep.counterIsRequired)))
    }
}
