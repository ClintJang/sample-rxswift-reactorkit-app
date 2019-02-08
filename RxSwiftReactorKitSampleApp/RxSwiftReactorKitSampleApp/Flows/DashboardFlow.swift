//
//  DashboardFlow.swift
//  RxSwiftReactorKitSampleApp
//
//  Created by Clint on 24/12/2018.
//  Copyright © 2018 clintjang. All rights reserved.
//

import Foundation

final class DashboardFlow: Flow {
    var root: Presentable {
        return self.rootViewController
    }

    let rootViewController = UITabBarController()
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
        case .dashboardIsRequired:
            return navigateToDashboard()
        default:
            return .none
        }
    }

    private func navigateToDashboard() -> FlowContributors {
        let counterFlow = CounterFlow(withServices: self.services)
        let githubSearchFlow = GitHubSearchFlow(withServices: self.services)
        let settingFlow = SettingFlow(withServices: self.services)

        Flows.whenReady(flow1: counterFlow, flow2: githubSearchFlow, flow3: settingFlow) { [unowned self] (root1: UINavigationController, root2: UINavigationController, root3: UINavigationController) in
            let tabBarItem1 = UITabBarItem(title: "Counter", image: nil, selectedImage: nil)
            let tabBarItem2 = UITabBarItem(title: "Search", image: nil, selectedImage: nil)
            let tabBarItem3 = UITabBarItem(title: "Setting", image: nil, selectedImage: nil)

            root1.tabBarItem = tabBarItem1
            root1.title = "Counter"
            root2.tabBarItem = tabBarItem2
            root2.title = "GitHub Search"
            root3.tabBarItem = tabBarItem3
            root3.title = "Setting"

            self.rootViewController.setViewControllers([root1, root2, root3], animated: false)
        }

        return .multiple(flowContributors: [.contribute(withNextPresentable: counterFlow,
                                                        withNextStepper: OneStepper(withSingleStep: SampleStep.counterIsRequired)),
                                            .contribute(withNextPresentable: githubSearchFlow,
                                                        withNextStepper: OneStepper(withSingleStep: SampleStep.gitHubSearchIsRequired)),
                                            .contribute(withNextPresentable: settingFlow,
                                                        withNextStepper: OneStepper(withSingleStep: SampleStep.settingIsRequired))])
        }
}
