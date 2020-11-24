//
//  APIClient.swift
//  GithubReposSwiftUI
//
//  Created by Razvan Rujoiu on 24.11.2020.
//

import Foundation
import Combine

struct APIClient {
    
    struct Response<T> {
        let value: T
        let urlResponse: URLResponse
    }
    
    func run<T: Decodable>(_ request: URLRequest) -> AnyPublisher<Response<T>, Error> {
        return URLSession.shared
            .dataTaskPublisher(for: request)
            .tryMap { result -> Response<T> in
                let value = try JSONDecoder().decode(T.self, from: result.data)
                return Response(value: value, urlResponse: result.response)
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
