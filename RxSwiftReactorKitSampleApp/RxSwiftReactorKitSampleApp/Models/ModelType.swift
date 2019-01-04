//
//  ModelType.swift
//  RxSwiftReactorKitSampleApp
//
//  Created by Clint on 05/01/2019.
//  Copyright © 2019 clintjang. All rights reserved.
//

import Then

protocol ModelType: Codable, Then {
    associatedtype Event

    static var dateDecodingStrategy: JSONDecoder.DateDecodingStrategy { get }
}

extension ModelType {
    static var dateDecodingStrategy: JSONDecoder.DateDecodingStrategy {
        return .iso8601
    }

    static var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = self.dateDecodingStrategy
        return decoder
    }
}
