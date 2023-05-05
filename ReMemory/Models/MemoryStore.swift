//
//  MemoryStore.swift
//  ReMemory
//
//  Created by Serra Abak on 5/4/23.
//

import SwiftUI

@MainActor
class MemoryStore: ObservableObject {
    @Published var memories: [Memory] = []
    
    private static func fileURL() -> URL {
        Utilities.getDocumentsDirectory().appendingPathComponent("memories.data")
    }
    
    func load() async throws {
        let task = Task<[Memory], Error> {
            let fileURL = Self.fileURL()
            guard let data = try? Data(contentsOf: fileURL) else {
                return []
            }
            let memories = try JSONDecoder().decode([Memory].self, from: data)
            return memories
        }
        let memories = try await task.value
        self.memories = memories
    }
    
    func save(memories: [Memory]) async throws {
        let task = Task {
            let data = try JSONEncoder().encode(memories)
            let outfile = Self.fileURL()
            try data.write(to: outfile)
        }
        _ = try await task.value
    }
}
