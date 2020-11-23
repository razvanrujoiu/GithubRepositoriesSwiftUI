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
        ZStack {
            RoundedRectangle(cornerRadius: 25.0, style: .continuous)
                .fill(Color.init(UIColor(red: 255/255, green: 255/255, blue: 250/255, alpha: 1)))
                .shadow(radius: 24)
                .padding(EdgeInsets(top: 24, leading: 24, bottom: 24, trailing: 24))
            VStack(alignment: .center) {
                
                Text(repository.owner.login).bold().font(.title2)
                RemoteImage(url: repository.owner.avatarUrl)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200, alignment: .center).clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/).shadow(radius: 20)
                Spacer().frame(height: 100)
                
                HStack {
                    Text("Repository: ").bold()
                    Text(repository.name)
                }
                HStack {
                    Text("Language:").bold()
                    Text(repository.language)
                }
                Spacer().frame(height: 24)
                Text(repository.description)
                
            }.padding(EdgeInsets(top: 36,leading: 36,bottom: 36,trailing: 36))
        }
        .background(Color.init(UIColor(red: 210/255, green: 210/255, blue: 210/255, alpha: 0.3)))
        .navigationBarTitle(Text(repository.fullName),displayMode: .inline)
        
    }
}

struct RepositoryDetails_Previews: PreviewProvider {
    static let repository = Repository.example
    static var previews: some View {
        RepositoryDetails(repository: repository)
    }
}
