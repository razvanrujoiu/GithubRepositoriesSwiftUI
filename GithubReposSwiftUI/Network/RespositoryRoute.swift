//
//  RespositoryRoute.swift
//  GithubReposSwiftUI
//
//  Created by Razvan Rujoiu on 23.11.2020.
//

import Foundation

enum RepositoryRoute {
    
    case java
    case swift
    case javascript
    case objc
}

extension RepositoryRoute: HttpRequest {
    
    var path: String {
        switch self {
        case .java:
            return "java&order=desc&sort=stars"
        case .swift:
            return "swift&order=desc&sort=stars"
        case .javascript:
            return "javascript&order=desc&sort=stars"
        case .objc:
            return "objc&order=desc&sort=stars"
        }
    }
    
    var method: HttpMethod {
        switch self {
        default:
            return .get
        }
    }
}
