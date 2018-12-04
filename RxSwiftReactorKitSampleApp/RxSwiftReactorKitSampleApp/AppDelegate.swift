//
//  AppDelegate.swift
//  RxSwiftReactorKitSampleApp
//
//  Created by Clint on 03/12/2018.
//  Copyright © 2018 clintjang. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        // any other good way?
        if let tabBarController = self.window?.rootViewController as? UITabBarController {

            tabBarController.viewControllers?.forEach({ (viewController) in
                if let controller = viewController as? MainViewController {
                    controller.reactor = MainViewReactor()
                } else if let controller = viewController as? GitHubSearchViewController {
                    controller.reactor = GitHubSearchViewReactor()
                } else if let controller = viewController as? SettingViewController {
                    controller.reactor = SettingViewReactor()
                }

            })
        }

        return true
    }

}
