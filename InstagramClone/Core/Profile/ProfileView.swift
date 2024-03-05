//
//  ProfileView.swift
//  InstagramClone
//
//  Created by Anga Koko on 03/03/2024.
//

import SwiftUI

struct ProfileView: View {
    
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 2),
        .init(.flexible(), spacing: 2),
        .init(.flexible(), spacing: 2),
    ]
    var body: some View {
        VStack{
            
            //Post grid view
            NavigationStack {
                ScrollView{
                    //Header
                    VStack(spacing: 10){
                        //Pic and stats
                        HStack{
                            Image("ProfilePic")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80)
                                .clipShape(Circle())
                            
                            HStack{
                                UserStatView(value: "3", title: "Posts")
                                
                                UserStatView(value: "3K", title: "Followers")
                                
                                UserStatView(value: "3", title: "Following")
                            }.frame(maxWidth: .infinity)
                            
                        }.padding(.horizontal)
                        
                        //Name and biso
                        VStack(alignment: .leading, spacing:  4) {
                            Text("Anga Koko")
                                .font(.footnote)
                                .fontWeight(.semibold)
                            
                            Text("Free and Accepted")
                                .font(.footnote)
                        }
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                        .padding(.horizontal)
                        
                        //Actioin Button
                        Button{
                            
                        }label: {
                            Text("Edit Profile")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .frame(width: 360, height: 32)
                                .foregroundColor(.black)
                                .overlay(RoundedRectangle(cornerRadius: 6).stroke(Color.gray, lineWidth: 1))
                        }
                        
                        Divider()
                    }
                    
                    LazyVGrid(columns: gridItems, spacing: 2){
                        ForEach(0 ... 15, id: \.self){
                            index in
                            Image("ProfilePic")
                                .resizable()
                                .scaledToFit()
                        }
                    }
                }.navigationTitle("Profile")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar{
                        ToolbarItem(placement: .navigationBarTrailing){
                            Button{
                                
                            } label: {
                                Image(systemName: "line.3.horizontal")
                                    .foregroundColor(.black)
                            }
                        }
                    }
            }
        }
    }
}

#Preview {
    ProfileView()
}
