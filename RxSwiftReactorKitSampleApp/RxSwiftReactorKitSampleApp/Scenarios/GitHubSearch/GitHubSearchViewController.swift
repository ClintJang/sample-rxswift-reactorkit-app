//
//  GitHubSearchViewController.swift
//  RxSwiftReactorKitSampleApp
//
//  Created by Clint on 04/12/2018.
//  Copyright © 2018 clintjang. All rights reserved.
//

import UIKit

class GitHubSearchViewController: BaseViewController, StoryboardView {

    lazy var reactor = GitHubSearchViewReactor()

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    func bind(reactor: GitHubSearchViewReactor) {

    }
}
