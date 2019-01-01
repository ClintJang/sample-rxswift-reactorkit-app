//
//  OnboardingIntroViewController.swift
//  RxSwiftReactorKitSampleApp
//
//  Created by Clint on 30/12/2018.
//  Copyright © 2018 clintjang. All rights reserved.
//

import UIKit
import Reusable

final class OnboardingIntroViewController: BaseViewController, StoryboardView, StoryboardBased, Stepper {

    @IBOutlet weak var completeButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.reactor = OnboardingIntroViewReactor()
    }

    func bind(reactor: OnboardingIntroViewReactor) {
        bindAction(reactor)
        bindState(reactor)
    }
}

// MARK: -
// MARK: Bind
private extension OnboardingIntroViewController {
    func bindAction(_ reactor: OnboardingIntroViewReactor) {
        completeButton.rx.tap
            .map { _ in Reactor.Action.introIsComplete }
            .bind(to: reactor.action)
            .disposed(by: self.disposeBag)
    }

    func bindState(_ reactor: OnboardingIntroViewReactor) {
        reactor.state
            .map { $0.step }
            .bind(to: self.step)
            .disposed(by: disposeBag)
    }
}

// MARK: -
