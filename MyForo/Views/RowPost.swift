//
//  PostRow.swift
//  MyForo
//
//  Created by Carlos Eduardo Umaña Acevedo on 17/6/21.
//

import SwiftUI

struct RowPost: View {
    let post : Post
    
    var body: some View {
        HStack {
            Image(systemName: "paperplane.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .foregroundColor(.blue)
            Text(post.title)
        }
    }
}

struct PostRow_Previews: PreviewProvider {
    static var previews: some View {
        RowPost(post: Post(userId: 1, id: 1, title: "Post title", body: "Body post"))
    }
}
