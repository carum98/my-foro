//
//  Posts.swift
//  MyForo
//
//  Created by Carlos Eduardo Umaña Acevedo on 17/6/21.
//

import Foundation

struct Post : Codable, Identifiable {
    var userId : Int
    var id : Int
    var title : String
    var body : String
}
