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
    
    init(id: UUID, date: Date, type: MemType, contentURL: String) {
        self.id = id
        self.date = date
        self.type = type
        self.contentURL = contentURL
    }
    func getContentURL() -> String {
        return Utilities.getDocumentsDirectory().appendingPathComponent(self.contentURL).absoluteString
    }
    
    func loadImage() -> UIImage {
        guard let image: UIImage = UIImage(contentsOfFile: getContentURL()) else {
            return UIImage(systemName: "photo")!
        }
        return image
    }
    
    static public func saveImageToDisk(image: UIImage) -> UUID {
        let uuid = UUID()
        let url = Utilities.getDocumentsDirectory().appendingPathComponent(uuid.uuidString+".jpg")
        print("url: ", url)
        if let data = image.pngData() {
            do {
                try data.write(to: url)
            } catch {
                print("Unable to write image data to disk")
            }
        }
        return uuid
    }
    
}

extension Memory {
    
    static let sampleMemoryList = [
        Memory(id: UUID(), date:Date(), type:MemType.image, contentURL:"image.jpg")
    ]
}
