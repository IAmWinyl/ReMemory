//
//  NewPhotoVideoView.swift
//  ReMemory
//
//  Created by Serra Abak on 5/2/23.
//

import SwiftUI

struct NewImageView: View {
    @Binding var newMemory: Memory
    
    var body: some View {
        ImagePicker(newImage: $newMemory)
    }
    
}

struct NewMediaView_Previews: PreviewProvider {
    static var previews: some View {
        NewImageView(newMemory: .constant(Memory.sampleMemoryList[0]))
    }
}
