//
//  CurrentUserProfileView.swift
//  InstagramClone
//
//  Created by Anga Koko on 19/09/2024.
//

import SwiftUI

struct CurrentUserProfileView: View {
    
    let user: User
    
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 2),
        .init(.flexible(), spacing: 2),
        .init(.flexible(), spacing: 2),
    ]
    
    var body: some View {
        NavigationStack {
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
                            .toolbar{
                                ToolbarItem(placement: .navigationBarTrailing){
                                    Button{
                                        try? AuthService().signOut()
                                    } label: {
                                        Image(systemName: "line.3.horizontal")
                                            .foregroundColor(.black)
                                    }
                                }
                            }
                    }
    }
}

#Preview {
    CurrentUserProfileView(user: User.MOCK_USER[0])
}
