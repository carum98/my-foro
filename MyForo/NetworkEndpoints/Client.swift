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
    
    
}
