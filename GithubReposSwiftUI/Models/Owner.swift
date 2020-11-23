//
//  Owner.swift
//  GithubReposSwiftUI
//
//  Created by Razvan Rujoiu on 23.11.2020.
//

import Foundation

struct Owner: Codable {
    let id: Double
    let login: String
    let url: String
    let avatarUrl: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case login
        case url
        case avatarUrl = "avatar_url"
    }
    
}
