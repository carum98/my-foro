//
//  Client.swift
//  MovieCenter
//
//  Created by Carlos Eduardo Umaña Acevedo on 17/6/21.
//

import Foundation

import Foundation

class Client: NetworkGeneric {
    let baseURL = "https://jsonplaceholder.typicode.com/"
    
    var session: URLSession
    
    init(session: URLSession) {
        self.session = session
    }
    
    func getPosts<T: Decodable>(type:T.Type, complete: @escaping (Result<T, ApiError>) -> Void) {
        let path = "posts"
        let url = URL(string: "\(baseURL)\(path)")
        let request = URLRequest(url: url!)
        
        self.fetch(type: T.self, with: request, completion: complete)
    }
    
    func createPost(post : Post, complete : @escaping (Result<Post, ApiError>) -> Void) {
        let path = "posts"
        let url = URL(string: "\(baseURL)\(path)")
        var request = URLRequest(url: url!)
        
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let parameters: [String: Any] = [
            "title": post.title,
            "body": post.body,
            "userId": post.userId
        ]
        
        let jsonData = try? JSONSerialization.data(withJSONObject: parameters)
        
        request.httpBody = jsonData
        
        self.fetch(type: Post.self, with: request, completion: complete)
    }
}
