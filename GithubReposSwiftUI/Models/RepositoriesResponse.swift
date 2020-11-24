//
//  Repositories.swift
//  GithubReposSwiftUI
//
//  Created by Razvan Rujoiu on 23.11.2020.
//

import Foundation

struct RepositoriesResponse: Codable {
    let items: [Repository]
    
    enum CodingKeys: String, CodingKey {
        case items = "items"
    }
}
