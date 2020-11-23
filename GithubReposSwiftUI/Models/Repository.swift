//
//  Repository.swift
//  GithubReposSwiftUI
//
//  Created by Razvan Rujoiu on 23.11.2020.
//

import Foundation

struct Repository: Codable, Identifiable {
    
    let id: Double
    let name: String
    let fullName: String
    let owner: Owner
    let description: String
    let language: String
    let forks: Double
    let stars: Double
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case fullName = "full_name"
        case owner
        case description
        case language
        case forks = "forks_count"
        case stars = "stargazers_count"
    }
    
    static let example = Repository(id: 21700699,
                                    name: "awesome-ios",
                                    fullName: "vsouza/awesome-ios",
                                    owner: Owner.example,
                                    description: "A curated list of awesome iOS ecosystem, including Objective-C and Swift Projects",
                                    language: "Swift",
                                    forks: 6022,
                                    stars: 36055)
    
}
