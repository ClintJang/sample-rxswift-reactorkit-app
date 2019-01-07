//
//  GitHubService.swift
//  RxSwiftReactorKitSampleApp
//
//  Created by Clint on 07/01/2019.
//  Copyright © 2019 clintjang. All rights reserved.
//

protocol GitHubServiceType {
    func search(query: String, page: String) -> Single<Bool?>
}

final class GitHubService: GitHubServiceType {
    fileprivate let networking = Networking<GitHubAPI>()

    func search(query: String, page: String) -> Single<Bool?> {
        return self.networking.request(.search(query: query, page: page))
            .map { response in
                log.info(response)
                return true
            }
    }
}
