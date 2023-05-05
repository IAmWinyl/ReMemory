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
}
