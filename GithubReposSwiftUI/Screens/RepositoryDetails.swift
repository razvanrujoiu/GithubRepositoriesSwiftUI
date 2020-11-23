//
//  RepositoryDetails.swift
//  GithubReposSwiftUI
//
//  Created by Razvan Rujoiu on 23.11.2020.
//

import SwiftUI

struct RepositoryDetails: View {
    
    let repository: Repository
    
    var body: some View {
        VStack(alignment: .center) {
            Text(repository.owner.login)
            RemoteImage(url: repository.owner.avatarUrl)
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200, alignment: .center)
            Text(repository.fullName)
            Text(repository.description)
        }
        .navigationBarTitle(Text(repository.fullName),displayMode: .inline)
       
    }
}

struct RepositoryDetails_Previews: PreviewProvider {
    static let repository = Repository.example
    static var previews: some View {
        RepositoryDetails(repository: repository)
    }
}
