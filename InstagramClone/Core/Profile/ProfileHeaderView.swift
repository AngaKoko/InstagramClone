//
//  ProfileHeaderView.swift
//  InstagramClone
//
//  Created by Anga Koko on 29/09/2024.
//

import SwiftUI

struct ProfileHeaderView: View {
    let user: User
    
    var body: some View {
        VStack(spacing: 10){
            //Pic and stats
            HStack{
                Image(user.profileUrl)
                    .resizable()
                    .scaledToFill()
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
                Text(user.fullName)
                    .font(.footnote)
                    .fontWeight(.semibold)
                
                Text(user.bio)
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
    }
}

#Preview {
    ProfileHeaderView(user: User.MOCK_USER[0])
}
