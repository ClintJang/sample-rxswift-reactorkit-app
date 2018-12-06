//
//  SettingViewController.swift
//  RxSwiftReactorKitSampleApp
//
//  Created by Clint on 03/12/2018.
//  Copyright © 2018 clintjang. All rights reserved.
//

import UIKit

class SettingViewController: BaseViewController, StoryboardView {

    override func viewDidLoad() {
        super.viewDidLoad()
        reactor = SettingViewReactor()
    }

    func bind(reactor: SettingViewReactor) {

    }
}
