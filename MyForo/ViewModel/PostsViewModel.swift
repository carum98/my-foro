//
//  PostsViewModel.swift
//  MyForo
//
//  Created by Carlos Eduardo Umaña Acevedo on 17/6/21.
//

import Foundation

class PostsViewModel: ObservableObject {
    @Published var posts = [Post]()
    
    var session = URLSession.shared
    var client:Client
    
    init() {
        client = Client(session: self.session)
    }
    
    func fetchPosts() {
        client.getPosts(type: [Post].self, complete: { result in
            switch result {
            case .success(let data):
                self.posts = data
            case .failure(let error):
                print(error)
            }
        })
    }
}
