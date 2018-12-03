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
        
        let navigationController = self.window?.rootViewController as! UINavigationController
        let viewController = navigationController.viewControllers.first as! MainViewController
        viewController.reactor = MainViewReactor()
        
        return true
    }

}

