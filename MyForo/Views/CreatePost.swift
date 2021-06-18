//
//  CreatePost.swift
//  MyForo
//
//  Created by Carlos Eduardo Umaña Acevedo on 18/6/21.
//

import SwiftUI

struct CreatePost: View {
    @State var titlePost : String = ""
    @State var bodyPost : String = ""
    
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
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("Save")
            }
        ))
    }
}

struct CreatePost_Previews: PreviewProvider {
    static var previews: some View {
        CreatePost()
    }
}
