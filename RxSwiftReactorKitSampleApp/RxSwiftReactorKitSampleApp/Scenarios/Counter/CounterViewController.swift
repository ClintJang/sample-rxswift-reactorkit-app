//
//  CounterViewController.swift
//  RxSwiftReactorKitSampleApp
//
//  Created by Clint on 24/12/2018.
//  Copyright © 2018 clintjang. All rights reserved.
//

import UIKit
import Reusable

class CounterViewController: BaseViewController, StoryboardBased, StoryboardView {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.reactor = CounterViewReactor()
    }

    func bind(reactor: CounterViewReactor) {
        bindAction(reactor)
        bindState(reactor)
    }
}

// MARK: -
// MARK: Bind
private extension CounterViewController {
    func bindAction(_ reactor: CounterViewReactor) {

    }

    func bindState(_ reactor: CounterViewReactor) {

    }
}

// MARK: -
