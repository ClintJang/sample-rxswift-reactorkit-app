//
//  SettingViewController.swift
//  RxSwiftReactorKitSampleApp
//
//  Created by Clint on 03/12/2018.
//  Copyright © 2018 clintjang. All rights reserved.
//

import UIKit
import Reusable

class SettingViewController: BaseViewController, StoryboardView, StoryboardBased {

    override func viewDidLoad() {
        super.viewDidLoad()
        reactor = SettingViewReactor()
    }

    func bind(reactor: SettingViewReactor) {
        bindAction(reactor)
        bindState(reactor)
        bindView(reactor)
    }
}

// MARK: -
// MARK: Bind
private extension SettingViewController {
    func bindView(_ reactor: SettingViewReactor) {}

    func bindAction(_ reactor: SettingViewReactor) {}

    func bindState(_ reactor: SettingViewReactor) {}
}
