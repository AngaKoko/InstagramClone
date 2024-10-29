//
//  EditProfileView.swift
//  InstagramClone
//
//  Created by Anga Koko on 25/10/2024.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel : EditProfileViewModel
    
    init(user: User){
        self._viewModel = StateObject(wrappedValue: EditProfileViewModel(user: user))
    }
    
    var body: some View {
        VStack{
            //Tool bar
            HStack{
                Button("Cancel"){
                    dismiss()
                }
                
                Spacer()
                
                Text("Edit Profile")
                    .font(.headline)
                    .fontWeight(.semibold)
                
                Spacer()
                
                Button(action: {
                    Task {try await viewModel.uploadUserData()}
                }, label: {
                    
                    Text("Done")
                        .font(.headline)
                        .fontWeight(.bold)
                })
                
            }.padding(.horizontal)
            
            Divider()
            
            //Edit profile pic
            PhotosPicker(selection: $viewModel.selectedImage){
                VStack {
                    if let image = viewModel.profileImage{
                        image
                            .resizable()
                            .frame(width: 80, height: 80)
                            .foregroundColor(.white)
                            .background(.gray)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    }else{
                        Image(systemName: "person")
                            .resizable()
                            .frame(width: 80, height: 80)
                            .foregroundColor(.white)
                            .background(.gray)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    }
                    
                    Text("Edit Profile Picture")
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
            }.padding(.vertical, 8)
            
            Divider()
            
            //Edit profile bio
            VStack{
                EditProfileRowView(title: "Name", placeholder: "Enter your name", text: $viewModel.fullName)
                EditProfileRowView(title: "Bio", placeholder: "Enter your bio", text: $viewModel.bio)
            }
            
            Spacer()
        }
    }
}

struct EditProfileRowView: View {
    let title: String
    let placeholder: String
    @Binding var text: String
    
    var body: some View {
        HStack{
            Text(title)
                .padding(.leading, 8)
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .leading)
            
            VStack{
                TextField(placeholder, text: $text)
                Divider()
            }
        }.font(.subheadline)
            .frame(height: 36)
    }
}

#Preview {
    EditProfileView(user: User.MOCK_USER[0])
}
