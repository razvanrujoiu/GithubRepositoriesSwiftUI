//
//  NetworkRout.swift
//  GithubReposSwiftUI
//
//  Created by Razvan Rujoiu on 23.11.2020.
//

import Foundation

protocol HttpRequest {
    
    var path: String { get }
    var method: HttpMethod { get }
    var headers: [String: String]? { get }
}

extension HttpRequest {
    
    var headers: [String: String]? {
        return nil
    }
    
    func create(for environment: BaseUrl) -> URLRequest {
        
        var request = URLRequest(url: URL(string: environment.rawValue + path)!)
        request.allHTTPHeaderFields = headers
        request.httpMethod = method.rawValue.uppercased()
        return request
    }
}
