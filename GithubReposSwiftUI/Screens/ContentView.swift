//
//  ContentView.swift
//  GithubReposSwiftUI
//
//  Created by Razvan Rujoiu on 23.11.2020.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel = RepositoryViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.repositories, id: \.id) { item in
                NavigationLink(destination: RepositoryDetails(repository: item)) {
                    RepositoryCell(repository: item)
                }
            }.navigationBarTitle("Github Repositories")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
