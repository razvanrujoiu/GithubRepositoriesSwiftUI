//
//  RepositoriesNetwork.swift
//  GithubReposSwiftUI
//
//  Created by Razvan Rujoiu on 23.11.2020.
//

import Foundation

struct RepositoriesNetwork: Network {
    
    var decoder: JSONDecoder = JSONDecoder()
    var environment: BaseUrl = .baseUrl
}
