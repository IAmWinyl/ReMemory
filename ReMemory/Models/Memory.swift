//
//  Memory.swift
//  ReMemory
//
//  Created by Serra Abak on 5/1/23.
//

import SwiftUI

class Memory: Identifiable, Codable, Equatable {
    
    static func == (lhs: Memory, rhs: Memory) -> Bool {
        if lhs.id == rhs.id && lhs.fileName == rhs.fileName && lhs.date == rhs.date && lhs.type == rhs.type {
            return true
        }
        return false
    }
    
    let id: UUID
    var date: Date
    var type: MemType
    var fileName: String
    
    init(id: UUID = UUID(), date: Date = Date(), type: MemType, fileName: String) {
        self.id = id
        self.date = date
        self.type = type
        self.fileName = fileName
    }
    func getContentURL() -> String {
        return Utilities.getDocumentsDirectory().appendingPathComponent(self.fileName).path
    }
    
    func loadImage() -> UIImage {
        guard let image: UIImage = UIImage(contentsOfFile: getContentURL()) else {
            print(getContentURL())
            return UIImage(systemName: "photo")!
        }
        return image
    }
    
}

extension Memory {
    
    static let sampleMemoryList = [
        Memory(id: UUID(), date: Date(), type: MemType.image, fileName: "image.jpg")
    ]
    static let emptyMemory = Memory(type: MemType.none, fileName: "")
}
