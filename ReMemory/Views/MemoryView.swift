//
//  MemoryView.swift
//  ReMemory
//
//  Created by Serra Abak on 5/1/23.
//

import SwiftUI

struct MemoryView: View {
    @Binding var memory: Memory
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "calendar")
                Text(memory.date, style:.date)
                    .font(.caption)
                Spacer()
            }
            Image(uiImage: memory.loadImage())
                .resizable()
                .aspectRatio(contentMode: .fit)
            
        }
    }
}

struct MemoryView_Previews: PreviewProvider {
    static var previews: some View {
        MemoryView(memory: .constant(Memory.sampleMemoryList[0]))
    }
}
