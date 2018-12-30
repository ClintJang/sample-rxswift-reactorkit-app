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
        print("\(type(of: self)): \(#function)")
    }

    func navigate(to step: Step) -> NextFlowItems {
        guard let step = step as? SampleStep else { return NextFlowItems.none }

        switch step {
        case .dashboard:
            return navigateToDashboard()
        default:
            return .none
        }
    }

    private func navigateToDashboard() -> NextFlowItems {
        return NextFlowItems.none
    }
}
