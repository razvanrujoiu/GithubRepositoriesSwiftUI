//
//  RepositoryCell.swift
//  GithubReposSwiftUI
//
//  Created by Razvan Rujoiu on 23.11.2020.
//

import SwiftUI

struct RepositoryCell: View {
    let repository: Repository
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "arrow.branch")
                Text("Name: \(repository.name)")
            }
            HStack {
                Image(systemName: "person.fill")
                Text("Owner: \(repository.owner.login)")
            }
            HStack {
                Image(systemName: "tuningfork")
                Text("Forks: \(String(format: "%.0f", repository.forks))")
            }
            HStack {
                Image(systemName: "star.fill")
                Text("Stars: \(String(format: "%.0f", repository.stars))")
            }
        }
    }
}

struct RepositoryCell_Previews: PreviewProvider {
    static let repository = Repository.example
    static var previews: some View {
        RepositoryCell(repository: repository)
    }
}
