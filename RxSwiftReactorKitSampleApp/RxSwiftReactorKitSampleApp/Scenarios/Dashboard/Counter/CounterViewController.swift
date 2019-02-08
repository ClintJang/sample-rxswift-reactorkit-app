//
//  CounterViewController.swift
//  RxSwiftReactorKitSampleApp
//
//  Created by Clint on 24/12/2018.
//  Copyright © 2018 clintjang. All rights reserved.
//

import UIKit
import Reusable
import SafariServices

class CounterViewController: BaseViewController, StoryboardBased, StoryboardView {

    @IBOutlet var decreaseButton: UIButton!
    @IBOutlet var increaseButton: UIButton!
    @IBOutlet var valueLabel: UILabel!
    @IBOutlet var activityIndicatorView: UIActivityIndicatorView!
    @IBOutlet weak var linkButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.reactor = CounterViewReactor()
    }

    func bind(reactor: CounterViewReactor) {
        bindAction(reactor)
        bindState(reactor)
        bindView(reactor)
    }
}

// MARK: -
// MARK: Bind
private extension CounterViewController {
    func bindView(_ reactor: CounterViewReactor) {
        linkButton.rx.tap
            .subscribe(onNext: { [weak self] in
                guard let self = self else { return }
                guard let url = URL(string: "https://github.com/ReactorKit/ReactorKit/blob/master/Examples/Counter/README.md") else { return }
                let viewController = SFSafariViewController(url: url)
                self.present(viewController, animated: true, completion: nil)
            })
            .disposed(by: disposeBag)
    }

    func bindAction(_ reactor: CounterViewReactor) {
        increaseButton.rx.tap               // Tap event
            .map { Reactor.Action.increase }  // Convert to Action.increase
            .bind(to: reactor.action)         // Bind to reactor.action
            .disposed(by: disposeBag)

        decreaseButton.rx.tap
            .map { Reactor.Action.decrease }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
    }

    func bindState(_ reactor: CounterViewReactor) {
        reactor.state.map { $0.value }   // 10
            .distinctUntilChanged()
            .map { "\($0)" }               // "10"
            .bind(to: valueLabel.rx.text)  // Bind to valueLabel
            .disposed(by: disposeBag)

        reactor.state.map { $0.isLoading }
            .distinctUntilChanged()
            .bind(to: activityIndicatorView.rx.isAnimating)
            .disposed(by: disposeBag)
    }
}

// MARK: -
