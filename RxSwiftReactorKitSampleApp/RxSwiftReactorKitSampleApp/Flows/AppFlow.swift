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
        log.info("\(type(of: self)): \(#function)")
    }

    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? SampleStep else { return FlowContributors.none }

        switch step {
        case .onboardingIsRequired:
            return navigationToOnboardingScreen()
        case .onboardingIsComplete, .dashboardIsRequired:
            return navigationToDashboardScreen()
        default:
            return FlowContributors.none
        }
    }

    private func navigationToOnboardingScreen() -> FlowContributors {

        if let rootViewController = self.rootWindow.rootViewController {
            rootViewController.dismiss(animated: false)
        }

        let onboardingFlow = OnboardingFlow(withServices: self.services)
        Flows.whenReady(flow1: onboardingFlow) { [unowned self] (root) in
            self.rootWindow.rootViewController = root
        }

        return .one(flowContributor: .contribute(withNextPresentable: onboardingFlow, withNextStepper: OneStepper(withSingleStep: SampleStep.introIsRequired)))
    }

    private func navigationToDashboardScreen() -> FlowContributors {
        let dashboardFlow = DashboardFlow(withServices: self.services)

        Flows.whenReady(flow1: dashboardFlow) { [unowned self] (root) in
            self.rootWindow.rootViewController = root
        }

        return .one(flowContributor: .contribute(withNextPresentable: dashboardFlow,
                                                 withNextStepper: OneStepper(withSingleStep: SampleStep.dashboardIsRequired)))
    }
}

class AppStepper: Stepper {

    let steps = PublishRelay<Step>()
    private let appServices: AppServices
    private let disposeBag = DisposeBag()

    init(withServices services: AppServices) {
        self.appServices = services
    }

    var initialStep: Step {
//        return SampleStep.dashboardIsRequired
        return SampleStep.onboardingIsRequired
    }

    /// callback used to emit steps once the FlowCoordinator is ready to listen to them to contribute to the Flow
    func readyToEmitSteps() {
        self.appServices
            .preferencesService.rx
            .isOnboarded
            .debug()
            .map { $0 ? SampleStep.onboardingIsComplete : SampleStep.onboardingIsRequired }
            .debug()
            .bind(to: self.steps)
            .disposed(by: self.disposeBag)
    }
}
