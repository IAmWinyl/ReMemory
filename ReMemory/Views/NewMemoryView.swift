//
//  NewMemoryView.swift
//  ReMemory
//
//  Created by Serra Abak on 5/1/23.
//

import SwiftUI

struct NewMemoryView: View {
    var body: some View {
        List {
            Section(header:Text("Photo")) {
                NavigationLink(destination:NewImageView()) {
                    Label("New Photo",systemImage: "photo")
                }
            }
            Section(header:Text("Video")) {
                NavigationLink(destination:NewVideoView()) {
                    Label("New Video",systemImage: "photo")
                }
            }
            Section(header:Text("Text")){
                NavigationLink(destination:NewTextView()){
                    Label("New Text", systemImage: "note.text")
                }
            }
            Section(header:Text("Link")){
                NavigationLink(destination:NewLinkView()){
                    Label("New Link", systemImage: "link.circle")
                }
            }
        }
    }
}

struct NewMemoryView_Previews: PreviewProvider {
    static var previews: some View {
        NewMemoryView()
    }
}
