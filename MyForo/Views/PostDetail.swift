//
//  PostDetail.swift
//  MyForo
//
//  Created by Carlos Eduardo Umaña Acevedo on 17/6/21.
//

import SwiftUI

struct PostDetail: View {
    let post : Post
    
    var body: some View {
        Text(post.body)
    }
}

struct PostDetail_Previews: PreviewProvider {
    static var previews: some View {
        PostDetail(post: Post(userId: 1, id: 1, title: "Post Title", body: "asd asdf asdf asdfa asdfada"))
    }
}
