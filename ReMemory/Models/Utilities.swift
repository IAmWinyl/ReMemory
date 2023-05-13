//
//  Utilities.swift
//  ReMemory
//
//  Created by Serra Abak on 5/4/23.
//

import SwiftUI

struct Utilities {
    
    static public func getDocumentsDirectory() -> URL {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = urls[0]
        
        return documentsDirectory
    }
    
    static public func saveImageToDisk(image: UIImage) -> Memory {
        let uuid = UUID()
        let fileName = uuid.uuidString+".jpg"
        let url = Utilities.getDocumentsDirectory().appendingPathComponent(fileName)
        print("url: ", url)
        if let data = image.pngData() {
            do {
                try data.write(to: url)
            } catch {
                print("Unable to write image data to disk")
            }
        }
        return Memory(id: uuid, date: Date(), type: MemType.image, fileName: fileName)
    }
}
