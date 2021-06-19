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
        fetchPosts()
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
    
    func createPost(post : Post) {
        client.createPost(post: post, complete: { result in
            switch result {
            case .success(var data):
                data.id = self.posts.count + 1
                self.posts.insert(data, at: 0)
            case .failure(let error):
                print(error)
            }
        })
    }
    
    func deletePost(at offsets: IndexSet) {
        posts.remove(atOffsets: offsets)
    }
    
    func moveItem(from source: IndexSet, to destination: Int) {
        posts.move(fromOffsets: source, toOffset: destination)
    }
}
