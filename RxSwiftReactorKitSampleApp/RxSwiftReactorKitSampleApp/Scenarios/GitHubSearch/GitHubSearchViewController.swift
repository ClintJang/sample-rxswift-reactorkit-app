//
//  GitHubSearchViewController.swift
//  RxSwiftReactorKitSampleApp
//
//  Created by Clint on 04/12/2018.
//  Copyright © 2018 clintjang. All rights reserved.
//

import UIKit
import SafariServices

class GitHubSearchViewController: BaseViewController, StoryboardView {

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
        // Action
        searchController.searchBar.rx.text
            .throttle(0.3, scheduler: MainScheduler.instance)
            .map { Reactor.Action.updateQuery($0) }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)

        tableView.rx.contentOffset
            .filter { [weak self] offset in
                guard let strongSelf = self else { return false }
                guard strongSelf.tableView.frame.height > 0 else { return false }
                return offset.y + strongSelf.tableView.frame.height >= strongSelf.tableView.contentSize.height - 100
            }
            .map { _ in Reactor.Action.loadNextPage }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)

        // State
        reactor.state.map { $0.repos }
            .bind(to: tableView.rx.items(cellIdentifier: "cell")) { _, repo, cell in
                cell.textLabel?.text = repo
            }
            .disposed(by: disposeBag)

        // View
        tableView.rx.itemSelected
            .subscribe(onNext: { [weak self, weak reactor] indexPath in
                guard let strongSelf = self else { return }
                strongSelf.view.endEditing(true)
                strongSelf.tableView.deselectRow(at: indexPath, animated: false)
                guard let repo = reactor?.currentState.repos[indexPath.row] else { return }
                guard let url = URL(string: "https://github.com/\(repo)") else { return }
                let viewController = SFSafariViewController(url: url)
                strongSelf.searchController.present(viewController, animated: true, completion: nil)
            })
            .disposed(by: disposeBag)

        linkButton.rx.tap
            .subscribe(onNext: { [weak self] in
                guard let strongSelf = self else { return }
                guard let url = URL(string: "https://github.com/ReactorKit/ReactorKit/blob/master/Examples/GitHubSearch/README.md") else { return }
                let viewController = SFSafariViewController(url: url)
                strongSelf.present(viewController, animated: true, completion: nil)
            })
            .disposed(by: disposeBag)
    }
}
