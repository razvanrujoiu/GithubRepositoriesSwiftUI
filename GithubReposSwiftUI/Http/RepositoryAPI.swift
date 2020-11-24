//
//  RepositoryAPI.swift
//  GithubReposSwiftUI
//
//  Created by Razvan Rujoiu on 24.11.2020.
//

import Foundation
import Combine

enum RepositoryAPI {
    static let apiClient = APIClient()
    static let baseUrl = URL(string: "https://api.github.com/search/repositories?q=language:java&order=desc&sort=stars")!
}

enum RepositoryPath: String {
    
    case none = ""

}

extension RepositoryAPI {
    
    static func request(_ path: RepositoryPath) -> AnyPublisher<RepositoriesResponse, Error> {
        guard let components = URLComponents(url:baseUrl, resolvingAgainstBaseURL: false) else {
            fatalError("Couldn't create URLComponents")
        }
        /*
         Only if the API requires an api key
        components.queryItems = [URLQueryItem(name: "api_key", value: "your_api_key_here")]
        */
        let request = URLRequest(url: components.url!)
        
        return apiClient.run(request)
            .map(\.value)
            .eraseToAnyPublisher()
    }
}
