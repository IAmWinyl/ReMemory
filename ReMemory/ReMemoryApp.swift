//
//  ReMemoryApp.swift
//  ReMemory
//
//  Created by Serra Abak on 5/1/23.
//

import SwiftUI

@main
struct ReMemoryApp: App {
    @StateObject private var store = MemoryStore()
    
    var body: some Scene {
        WindowGroup {
            HomeView(memories: $store.memories) {
                Task {
                    do {
                        try await store.save(memories: store.memories)
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }
            .task {
                do {
                    try await store.load()
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}
