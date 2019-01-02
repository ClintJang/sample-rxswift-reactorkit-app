//
//  AppFlow.swift
//  RxSwiftReactorKitSampleApp
//
//  Created by Clint on 19/12/2018.
//  Copyright © 2018 clintjang. All rights reserved.
//

import UIKit

final class AppFlow: Flow {

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
        case .onboarding:
            return navigationToOnboardingScreen()
        case .onboardingIsComplete, .dashboard:
            return navigationToDashboardScreen()
        default:
            return NextFlowItems.none
        }
    }

    private func navigationToOnboardingScreen() -> NextFlowItems {

        if let rootViewController = self.rootWindow.rootViewController {
            rootViewController.dismiss(animated: false)
        }

        let onboardingFlow = OnboardingFlow(withServices: self.services)
        Flows.whenReady(flow1: onboardingFlow) { [unowned self] (root) in
            self.rootWindow.rootViewController = root
        }

        return .one(flowItem: NextFlowItem(nextPresentable: onboardingFlow,
                                           nextStepper: OneStepper(withSingleStep: SampleStep.intro)))
    }

    private func navigationToDashboardScreen() -> NextFlowItems {
        let dashboardFlow = DashboardFlow(withServices: self.services)

        Flows.whenReady(flow1: dashboardFlow) { [unowned self] (root) in
            self.rootWindow.rootViewController = root
        }

        return .one(flowItem: NextFlowItem(nextPresentable: dashboardFlow,
                                           nextStepper: OneStepper(withSingleStep: SampleStep.dashboard)))
    }
}

class AppStepper: Stepper {
    init(withServices services: AppServices) {
        if services.preferencesService.isOnboarded() {
            self.step.accept(SampleStep.dashboard)
        } else {
            self.step.accept(SampleStep.onboarding)
        }
    }
}
