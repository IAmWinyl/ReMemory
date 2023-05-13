//
//  NewMemoryView.swift
//  ReMemory
//
//  Created by Serra Abak on 5/1/23.
//

import SwiftUI

struct NewMemoryView: View {
    @Binding var memories: [Memory]
    @State private var newMemory: Memory = Memory.emptyMemory
    
    var body: some View {
        NavigationStack {
            List {
                Section(header:Text("Photo")) {
                    NavigationLink(destination:NewImageView(newMemory: $newMemory)) {
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
        .onChange(of: newMemory) { newValue in
            memories.append(newMemory)
        }
    }
}

struct NewMemoryView_Previews: PreviewProvider {
    static var previews: some View {
        NewMemoryView(memories: .constant(Memory.sampleMemoryList))
    }
}
