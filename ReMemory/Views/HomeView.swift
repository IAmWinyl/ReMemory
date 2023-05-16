//
//  HomeView.swift
//  ReMemory
//
//  Created by Serra Abak on 5/1/23.
//

import SwiftUI

struct HomeView: View {
    @Binding var memories: [Memory]
    @State private var isPresentingNewMemory = false
    @Environment(\.scenePhase) private var scenePhase
    let saveAction: () -> Void
    
    var body: some View {
        NavigationStack {
            List {
                ForEach($memories) { memory in
                    MemoryView(memory: memory)
                }
            }
            .toolbar {
                Button(action: {
                    isPresentingNewMemory = true
                }) {
                    Image(systemName: "plus")
                }
            }
        }
        .task {
            if memories.isEmpty {
                isPresentingNewMemory = false
            }
        }
        .sheet(isPresented: $isPresentingNewMemory) {
            NavigationStack {
                NewMemoryView(memories: $memories)
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
        .onChange(of: scenePhase) { phase in
            if phase == .inactive { saveAction() }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(memories: .constant(Memory.sampleMemoryList), saveAction: {})
    }
}
