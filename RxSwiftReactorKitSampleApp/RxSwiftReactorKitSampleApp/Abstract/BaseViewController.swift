//
//  BaseViewController.swift
//  RxSwiftReactorKitSampleApp
//
//  Created by Clint on 04/12/2018.
//  Copyright © 2018 clintjang. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    lazy private(set) var className: String = {
        return type(of: self).description().components(separatedBy: ".").last ?? ""
    }()

    var disposeBag = DisposeBag()

    deinit {
        log.info("DEINIT: \(self.className)")
    }
}
