//
//  OnboardingFlow.swift
//  RxSwiftReactorKitSampleApp
//
//  Created by Clint on 30/12/2018.
//  Copyright © 2018 clintjang. All rights reserved.
//

import Foundation

final class OnboardingFlow: Flow {
    var root: Presentable {
        return self.rootViewController
    }

    private lazy var rootViewController: UINavigationController = {
        let viewController = UINavigationController()
        viewController.navigationBar.topItem?.title = "OnBoarding"
        return viewController
    }()

    private let services: AppServices

    init(withServices services: AppServices) {
        self.services = services
    }

    deinit {
        log.info("\(type(of: self)): \(#function)")
    }

    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? SampleStep else { return .none }

        switch step {
        case .introIsRequired:
            return navigationToOnboardingIntroScreen()
        case .introIsComplete:
            return .end(forwardToParentFlowWithStep: SampleStep.onboardingIsComplete)
        default:
            return .none
        }
    }

    private func navigationToOnboardingIntroScreen() -> FlowContributors {
        let onboardingIntroViewController = OnboardingIntroViewController.instantiate()

        onboardingIntroViewController.title = "앱 소개"
        self.rootViewController.pushViewController(onboardingIntroViewController, animated: false)
        return .one(flowContributor: .contribute(withNextPresentable: onboardingIntroViewController,
                                                 withNextStepper: onboardingIntroViewController))
    }
}
