//
//  MainViewController.swift
//  RxSwiftReactorKitSampleApp
//
//  Created by Clint on 03/12/2018.
//  Copyright © 2018 clintjang. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, StoryboardView {
    @IBOutlet weak var tempLabel: UILabel!

    var disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        // SwiftGen Test Setting
        tempLabel.text = Localized.coding
    }

    func bind(reactor: MainViewReactor) {

    }
}
