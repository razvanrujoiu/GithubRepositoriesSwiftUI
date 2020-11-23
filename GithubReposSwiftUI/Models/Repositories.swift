//
//  Repositories.swift
//  GithubReposSwiftUI
//
//  Created by Razvan Rujoiu on 23.11.2020.
//

import Foundation

struct Repositories: Codable {
    let items: [Repository]
    
    enum CodingKeys: String, CodingKey {
        case items = "items"
    }
}
