//
//  HomeView.swift
//  ReMemory
//
//  Created by Serra Abak on 5/1/23.
//

import SwiftUI

struct HomeView: View {
    var memories: [Memory] = Memory.sampleMemoryList
    @State private var isPresentingNewMemory: Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(memories) { memory in
                    MemoryView(memory: memory)
                }
            }
            .toolbar {
                Button(action: {
                    isPresentingNewMemory = true
                }) {R
                    Image(systemName: "plus")
                }
            }
        }
        .sheet(isPresented: $isPresentingNewMemory) {
            NavigationStack {
                NewMemoryView()
                    .toolbar {
                        ToolbarItem(placement:.confirmationAction) {
                            Button("Save") {
                                isPresentingNewMemory = false
                            }
                        }
                        ToolbarItem(placement:.cancellationAction) {
                            Button("Cancel") {
                                isPresentingNewMemory = false
                            }
                        }
                    }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
