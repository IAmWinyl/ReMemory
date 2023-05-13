//
//  MemType.swift
//  ReMemory
//
//  Created by Serra Abak on 5/1/23.
//

import Foundation

enum MemType : String, CaseIterable, Identifiable, Codable {
    case none
    case video
    case audio
    case image
    case text
    case link
    
    var name: String {
        rawValue
    }
    var id: String {
        name
    }
}

