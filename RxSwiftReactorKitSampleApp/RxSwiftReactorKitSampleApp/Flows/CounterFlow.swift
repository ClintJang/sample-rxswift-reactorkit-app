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
        print("\(type(of: self)): \(#function)")
    }

    func navigate(to step: Step) -> NextFlowItems {

        guard let step = step as? SampleStep else { return NextFlowItems.none }

        switch step {

        case .counter:
            return navigateToCounterScreen()
        default:
            return NextFlowItems.none
        }
    }

    private func navigateToCounterScreen() -> NextFlowItems {
        let viewController = CounterViewController.instantiate()
        viewController.title = "Counter"

        self.rootViewController.pushViewController(viewController, animated: true)
        return .one(flowItem: NextFlowItem(nextPresentable: viewController,
                                           nextStepper: OneStepper(withSingleStep: SampleStep.counter)))
    }
}
