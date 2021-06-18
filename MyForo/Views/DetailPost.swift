//
//  PostDetail.swift
//  MyForo
//
//  Created by Carlos Eduardo Umaña Acevedo on 17/6/21.
//

import SwiftUI

struct DetailPost: View {
    let post : Post
    
    var body: some View {
        VStack {
            Image(systemName: "paperplane.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .foregroundColor(.blue)
            Text(post.title)
                .bold()
                .padding(.vertical, 50)
            Text(post.body)
                .padding(.vertical, 50)
            Spacer()
        }
        .padding(.horizontal, 50)
    }
}

struct PostDetail_Previews: PreviewProvider {
    static var previews: some View {
        DetailPost(post: Post(userId: 1, id: 1, title: "Post Title", body: "asd asdf asdf asdfa asdfada"))
    }
}
