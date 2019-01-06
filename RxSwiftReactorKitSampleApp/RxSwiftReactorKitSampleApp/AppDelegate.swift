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
    let disposeBag = DisposeBag()

    var window: UIWindow?
    var coordinator = Coordinator()
    var appFlow: AppFlow!
    let preferencesService = PreferencesService()
    lazy var appServices = {
        return AppServices(preferencesService: self.preferencesService)
    }()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        guard let window = self.window else { return false }

        coordinator.rx.willNavigate.subscribe(onNext: { (flow, step) in
            log.debug("\n➡️ will navigate to flow=\(flow) and step=\(step)")
        }).disposed(by: self.disposeBag)

        // 작업 후에.. 
        coordinator.rx.didNavigate.subscribe(onNext: { (flow, step) in
            log.debug("\n➡️ did navigate to flow=\(flow) and step=\(step)")
        }).disposed(by: self.disposeBag)

        self.appFlow = AppFlow(withWindow: window, andServices: self.appServices)

        coordinator.coordinate(flow: self.appFlow, withStepper: AppStepper(withServices: self.appServices))

        return true
    }

}

struct AppServices: HasPreferencesService {
    let preferencesService: PreferencesService
}
