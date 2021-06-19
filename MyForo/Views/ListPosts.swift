//
//  PostsList.swift
//  MyForo
//
//  Created by Carlos Eduardo Umaña Acevedo on 17/6/21.
//

import SwiftUI

struct ListPosts: View {
    @ObservedObject var viewModel : PostsViewModel = PostsViewModel()
    
    var body: some View {
        NavigationView{
            List {
                ForEach(self.viewModel.posts, id: \.id) { item in
                    NavigationLink(
                        destination: DetailPost(post: item),
                        label: {
                            RowPost(post: item)
                        })
                }
                .onMove(perform: viewModel.moveItem)
                .onDelete(perform: viewModel.deletePost)
            }
            .navigationBarTitle("Posts")
            .navigationBarItems(
                leading: EditButton(),
                trailing: addButton
            )
        }
    }
    
    private var addButton : some View {
        NavigationLink(
            destination: CreatePost(viewModel: viewModel),
            label: {
                HStack {
                    Image(systemName: "paperplane.circle")
                    Text("New Post")
                }
            })
    }
}

struct PostsList_Previews: PreviewProvider {
    static var previews: some View {
        ListPosts()
    }
}
