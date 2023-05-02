//
//  Memory.swift
//  ReMemory
//
//  Created by Serra Abak on 5/1/23.
//

import SwiftUI

struct Memory: Identifiable, Codable {
    let id: UUID
    var date: Date
    var type: MemType
    var contentURL: String
    
    init(id: UUID = UUID(), date: Date, type: MemType, contentURL: String) {
        self.id = id
        self.date = date
        self.type = type
        self.contentURL = contentURL
    }
    static private func getDocumentsDirectory() -> URL {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = urls[0]
        
        return documentsDirectory
    }
    func getContentURL() -> String {
        return Self.getDocumentsDirectory().appendingPathComponent(self.contentURL).absoluteString
    }
    
    func loadImage() -> UIImage {
        guard let image: UIImage = UIImage(contentsOfFile: getContentURL()) else {
            return UIImage(systemName: "photo")!
        }
        return image
    }
}

extension Memory {
    
    static let sampleMemoryList = [
        Memory(date:Date(), type:MemType.image, contentURL:"sample.jpg"),
        Memory(date:Date(), type:MemType.text, contentURL:"sample_txt.txt"),
        Memory(date:Date(), type:MemType.link, contentURL:"sample_link.txt"),
        Memory(date:Date(), type:MemType.video, contentURL:"sample.mp4")
    ]
}
