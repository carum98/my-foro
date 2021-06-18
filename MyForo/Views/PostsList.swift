//
//  PostsList.swift
//  MyForo
//
//  Created by Carlos Eduardo Umaña Acevedo on 17/6/21.
//

import SwiftUI

struct PostsList: View {
    @ObservedObject var viewModel : PostsViewModel = PostsViewModel()
    
    var body: some View {
        NavigationView{
            List {
                ForEach(self.viewModel.posts, id: \.id) { item in
                    NavigationLink(
                        destination: PostDetail(post: item),
                        label: {
                            Text(item.title)
                        })
                }
            }
            .navigationBarTitle("MyForo")
            .navigationBarItems(trailing: EditButton())
            .onAppear {
                viewModel.fetchPosts()
            }
        }
    }
}

struct PostsList_Previews: PreviewProvider {
    static var previews: some View {
        PostsList()
    }
}
