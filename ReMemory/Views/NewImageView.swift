//
//  NewPhotoVideoView.swift
//  ReMemory
//
//  Created by Serra Abak on 5/2/23.
//

import SwiftUI

struct NewImageView: View {
    @State private var imageUUID: UUID = UUID()
    
    var body: some View {
        ImagePicker(imageUUID: $imageUUID)
    }
    
}

struct NewMediaView_Previews: PreviewProvider {
    static var previews: some View {
        NewImageView()
    }
}
