//
//  GitHubSearchViewController.swift
//  RxSwiftReactorKitSampleApp
//
//  Created by Clint on 04/12/2018.
//  Copyright © 2018 clintjang. All rights reserved.
//

import UIKit
import Reusable
import SafariServices

class GitHubSearchViewController: BaseViewController, StoryboardView, StoryboardBased {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var linkButton: UIButton!

    let searchController = UISearchController(searchResultsController: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
        self.definesPresentationContext = true

        reactor = GitHubSearchViewReactor()
        tableView.scrollIndicatorInsets.top = tableView.contentInset.top
        searchController.dimsBackgroundDuringPresentation = false
        if #available(iOS 11.0, *) {
            navigationItem.searchController = searchController
        }
    }

    func bind(reactor: GitHubSearchViewReactor) {

        bindAction(reactor)
        bindState(reactor)

        tableView.rx.itemSelected
            .subscribe(onNext: { [weak self, weak reactor] indexPath in
                guard let self = self else { return }
                self.view.endEditing(true)
                self.tableView.deselectRow(at: indexPath, animated: false)
                guard let repo = reactor?.currentState.repos[indexPath.row] else { return }
                guard let url = URL(string: "https://github.com/\(repo)") else { return }
                let viewController = SFSafariViewController(url: url)
                self.searchController.present(viewController, animated: true, completion: nil)
            })
            .disposed(by: disposeBag)

        linkButton.rx.tap
            .subscribe(onNext: { [weak self] in
                guard let self = self else { return }
                guard let url = URL(string: "https://github.com/ReactorKit/ReactorKit/blob/master/Examples/GitHubSearch/README.md") else { return }
                let viewController = SFSafariViewController(url: url)
                self.present(viewController, animated: true, completion: nil)
            })
            .disposed(by: disposeBag)
    }
}

// MARK: -
// MARK: Bind
private extension GitHubSearchViewController {
    func bindAction(_ reactor: GitHubSearchViewReactor) {
        searchController.searchBar.rx.text
            .throttle(0.3, scheduler: MainScheduler.instance)
            .map { Reactor.Action.updateQuery($0) }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)

        tableView.rx.contentOffset
            .filter { [weak self] offset in
                guard let self = self else { return false }
                guard self.tableView.frame.height > 0 else { return false }
                return offset.y + self.tableView.frame.height >= self.tableView.contentSize.height - 100
            }
            .map { _ in Reactor.Action.loadNextPage }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
    }

    func bindState(_ reactor: GitHubSearchViewReactor) {
        reactor.state.map { $0.repos }
            .bind(to: tableView.rx.items(cellIdentifier: "cell")) { _, repo, cell in
                cell.textLabel?.text = repo
            }
            .disposed(by: disposeBag)
    }
}
