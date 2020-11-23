//
//  ContentView.swift
//  GithubReposSwiftUI
//
//  Created by Razvan Rujoiu on 23.11.2020.
//

import SwiftUI

struct ContentView: View {
    
    @State var repositories = [Repository]()
    
    var body: some View {
        List(repositories, id: \.id) { item in
            VStack(alignment: .leading) {
                Text(item.name)
                Text(item.fullName)
                Text("Forks: \(item.forks)")
                Text("Watchers: \()")
            }
            
        }.onAppear(perform: {
            loadRepositories()
        })
    }
    
    func loadRepositories() {
        guard let endpoint = URL(string: "https://api.github.com/search/repositories?q=language:swift,objc&order=desc&sort=stars") else {
            print("API endpoint is invalid")
            return
        }
        let request = URLRequest(url: endpoint)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let response = try? JSONDecoder().decode(Repositories.self, from: data) {
                    DispatchQueue.main.async {
                        self.repositories = response.items
                        
                    }
                    return
                }
            }
        }.resume()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
