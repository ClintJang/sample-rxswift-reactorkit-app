//
//  GitHubSearchAPI.swift
//  RxSwiftReactorKitSampleApp
//
//  Created by Clint on 07/01/2019.
//  Copyright © 2019 clintjang. All rights reserved.
//

import Moya
import MoyaSugar

enum GitHubAPI {
    case search(query: String, page: String)
}

extension GitHubAPI: SugarTargetType {
    var baseURL: URL {
        return URL(string: "https://api.github.com")!
    }

    var route: Route {
        switch self {
        case .search:
            return .get("search/repositories")
        }
    }

    var parameters: Parameters? {
        switch self {
        case let .search(query, page):
            return ["q": query, "page": page]
        }
    }

    var headers: [String: String]? {
        return nil
    }

    var sampleData: Data {
        return Data()
    }
}
