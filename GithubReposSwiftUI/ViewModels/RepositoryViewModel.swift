//
//  RepositoryViewModel.swift
//  GithubReposSwiftUI
//
//  Created by Razvan Rujoiu on 24.11.2020.
//

import Foundation
import Combine

class RepositoryViewModel: BaseViewModel, ObservableObject {
    
    typealias NetworkResource = Repository
    
    var resource: Resource<NetworkResource> = .loading
    var baseApi: BaseAPI
    var request: HttpRequest = RepositoryRoute.java
    var bag: Set<AnyCancellable> = Set<AnyCancellable>()
    
    init(with baseApi: BaseAPI) {
        self.baseApi = baseApi
    }
}
