//
//  CreatePost.swift
//  MyForo
//
//  Created by Carlos Eduardo Umaña Acevedo on 18/6/21.
//

import SwiftUI

struct CreatePost: View {
    @ObservedObject var viewModel : PostsViewModel
    
    @State var titlePost : String = ""
    @State var bodyPost : String = ""
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("Title")) {
                    TextField("",text: $titlePost)
                }
                Section(header: Text("Body")) {
                    TextEditor(text: $bodyPost)
                }
            }
            Spacer()
        }
        .navigationBarTitle("New Post")
        .navigationBarItems(trailing:
            Button(action: createPost, label: { Text("Save") }
            )
            .disabled(titlePost.isEmpty || bodyPost.isEmpty)
        )
    }
    
    func createPost() {
        let post = Post(
            userId: 1,
            id: 0,
            title: titlePost,
            body: bodyPost
        )
        
        viewModel.createPost(post: post)
        
        self.presentationMode.wrappedValue.dismiss()
    }
}

struct CreatePost_Previews: PreviewProvider {
    static var previews: some View {
        CreatePost(viewModel: PostsViewModel())
    }
}
