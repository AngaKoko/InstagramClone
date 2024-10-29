//
//  EditProfileViewModel.swift
//  InstagramClone
//
//  Created by Anga Koko on 25/10/2024.
//

import _PhotosUI_SwiftUI
import SwiftUI
import Firebase

@MainActor
class EditProfileViewModel: ObservableObject{
    @Published var selectedImage: PhotosPickerItem? {
        didSet {Task {await uploadImage(fromItem: selectedImage)}}
    }
    
    @Published var user: User
    @Published var profileImage: Image?
    @Published var fullName = ""
    @Published var bio = ""
    private var uiImage: UIImage?
    
    init(user: User){
        self.user = user
    }
    
    func uploadImage(fromItem item: PhotosPickerItem?) async {
        guard let item = item else {return}
        
        guard let data = try? await item.loadTransferable(type: Data.self) else {return}
        guard let uiImage = UIImage(data: data) else {return}
        self.uiImage = uiImage
        self.profileImage = Image(uiImage: uiImage)
    }
    
    func uploadUserData() async throws{
        //update profile picture if changed
        var data = [String: Any]()
        
        //upload user profile
        if let uiImage = uiImage{
            let imgUrl = try? await ImageUploader().uploadImage(image: uiImage)
            data["profileImageUrl"] = imgUrl
        }
        
        //update name if changed
        if !fullName.isEmpty && user.fullName != fullName{
            data["fullname"] = fullName
        }
        
        //update bio if changed
        if !bio.isEmpty && user.bio != bio{
            data["bio"] = bio
        }
        
        if !data.isEmpty{
            let resposne = Firestore.firestore().collection("users").document(user.id).updateData(data)
        }
    }
}
