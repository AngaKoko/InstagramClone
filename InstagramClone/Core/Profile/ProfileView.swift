//
//  ProfileView.swift
//  InstagramClone
//
//  Created by Anga Koko on 03/03/2024.
//

import SwiftUI

struct ProfileView: View {
    
    let user: User
    
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 2),
        .init(.flexible(), spacing: 2),
        .init(.flexible(), spacing: 2),
    ]
    var body: some View {
        VStack{
            
            //Post grid view
                ScrollView{
                    //Header
                    ProfileHeaderView(user: user)
                    
                    LazyVGrid(columns: gridItems, spacing: 2){
                        ForEach(Post.MOCK_POST){
                            post in
                            Image(post.imageUrl)
                                .resizable()
                                .modifier(ProfilePostImg())
                        }
                    }
                }.navigationTitle("Profile")
                    .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ProfileView(user: User.MOCK_USER[0])
}
