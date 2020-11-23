//
//  Network.swift
//  GithubReposSwiftUI
//
//  Created by Razvan Rujoiu on 23.11.2020.
//

import Foundation
import Combine

protocol Network {
    
    var decoder: JSONDecoder { get set }
    var environment: BaseUrl { get set }
}

extension Network {
    
    func fetch<T: Decodable>(route: NetworkRoute) -> AnyPublisher<T, Error> {
        let request = route.create(for: environment)
        return URLSession.shared
            .dataTaskPublisher(for: request)
            .tryCompactMap { result in
                try self.decoder.decode(T.self, from: result.data)
            }
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
