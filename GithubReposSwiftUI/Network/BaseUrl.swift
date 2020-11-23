//
//  NetworkEnvironment.swift
//  GithubReposSwiftUI
//
//  Created by Razvan Rujoiu on 23.11.2020.
//

/*
 "https://api.github.com/search/repositories?q=language:javascript&order=desc&sort=stars"

 */

import Foundation



enum BaseUrl: String {
    case baseUrl = "https://api.github.com/search/repositories?q=language:"
}
