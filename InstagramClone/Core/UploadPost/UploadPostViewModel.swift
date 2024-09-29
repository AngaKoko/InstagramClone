//
//  UploadPostViewModel.swift
//  InstagramClone
//
//  Created by Anga Koko on 29/09/2024.
//

import Foundation
import _PhotosUI_SwiftUI
import SwiftUI

class UploadPostViewModel: ObservableObject{
    
    @Published var selectedImage: PhotosPickerItem? {
        didSet {Task {await uploadImage(fromItem: selectedImage)}}
    }
    
    @Published var postImg: Image?
    
    func uploadImage(fromItem item: PhotosPickerItem?) async {
        guard let item = item else {return}
        
        guard let data = try? await item.loadTransferable(type: Data.self) else {return}
        guard let uiImage = UIImage(data: data) else {return}
        self.postImg = Image(uiImage: uiImage)
    }
}
