//
//  RepositoryViewModel.swift
//  GithubReposSwiftUI
//
//  Created by Razvan Rujoiu on 24.11.2020.
//

import Foundation
import Combine

class RepositoryViewModel: ObservableObject {
    
    @Published var repositories: [Repository] = []
    var cancellationToken: AnyCancellable?
    
    init() {
        getRepositories()
    }
}

extension RepositoryViewModel {
    
    func getRepositories() {
        cancellationToken = RepositoryAPI.request(.none)
            .mapError({ (error) -> Error in
                print(error)
                return error
            }).sink(receiveCompletion: { _ in
                
            }, receiveValue: {
                self.repositories = $0.items
            })
    }
}
