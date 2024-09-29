//
//  UploadPostView.swift
//  InstagramClone
//
//  Created by Anga Koko on 29/09/2024.
//

import SwiftUI
import PhotosUI

struct UploadPostView: View {
    @State private var caption: String = ""
    @State private var isImagePickerPresented = false
    @StateObject var viewModel = UploadPostViewModel()
    @Binding var tabIndex: Int
    
    var body: some View {
        VStack{
            //Actoin tool bar
            HStack{
                Button{
                    caption = ""
                    viewModel.selectedImage = nil
                    viewModel.postImg = nil
                    tabIndex = 0
                }label: {
                    Text("Cancel")
                }
                
                Spacer()
                
                Text("Upload Post")
                    .fontWeight(.semibold)
                
                Spacer()
                
                Button{
                    print("Upload post")
                }label: {
                    Text("Upload")
                        .fontWeight(.semibold)
                }
            }.padding(.horizontal)
            
            //post image and caption
            HStack(spacing: 8){
                if let image = viewModel.postImg{
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                        .clipped()
                }
                
                TextField("Enter your caption ...", text: $caption, axis: .vertical)
            }.padding()
            
            Spacer()
        }
        .onAppear(){
            isImagePickerPresented.toggle()
        }
        .photosPicker(isPresented: $isImagePickerPresented, selection: $viewModel.selectedImage)
    }
}

#Preview {
    UploadPostView(tabIndex: .constant(0))
}
