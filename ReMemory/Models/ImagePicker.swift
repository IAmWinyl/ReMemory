//
//  MediaPicker.swift
//  ReMemory
//
//  Created by Serra Abak on 5/2/23.
//

import SwiftUI
import PhotosUI


struct ImagePicker: UIViewControllerRepresentable {
    @Binding var newImage: Memory
    
    func makeUIViewController(context: Context) -> PHPickerViewController {
        var config = PHPickerConfiguration()
        config.filter = .images
        
        let picker = PHPickerViewController(configuration: config)
        picker.delegate = context.coordinator
        
        return picker
    }
    
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, PHPickerViewControllerDelegate {
        let parent: ImagePicker
        
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            // Tell picker to dismiss itself
            picker.dismiss(animated: true)
            
            // Exit if no selection was made
            guard let provider = results.first?.itemProvider else {
                return
            }
            
            // If image chosen, save it into MediaPicker's media var
            if provider.canLoadObject(ofClass: UIImage.self) {
                provider.loadObject(ofClass: UIImage.self) { image, _ in
                    self.parent.newImage = Utilities.saveImageToDisk(image: (image as? UIImage)!)
                }
            }
            
        }
    }
    

}
