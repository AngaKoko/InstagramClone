//
//  FeedCell.swift
//  InstagramClone
//
//  Created by Anga Koko on 04/03/2024.
//

import SwiftUI

struct FeedCell: View {
    let post : Post
    
    var body: some View {
        VStack{
            //Image + User name
            if let user = post.user{
                HStack{
                    Image(user.profileUrl)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 48, height: 48)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    
                    Text(user.username)
                        .font(.footnote)
                        .fontWeight(.semibold)
                    
                    Spacer()
                }.padding(.leading)
            }
            
            //Post image
            Image(post.imageUrl)
                .resizable()
                .scaledToFill()
                .frame(height: 400)
                .clipShape(Rectangle())
            
            //Action buttons
            HStack(spacing: 16){
                Button{
                    print("Like post")
                }label: {
                    Image(systemName: "heart")
                        .imageScale(.large)
                }
                
                Button{
                    print("Comment on post")
                }label: {
                    Image(systemName: "bubble.right")
                        .imageScale(.large)
                }
                
                Button{
                    print("Share post")
                }label: {
                    Image(systemName: "paperplane")
                        .imageScale(.large)
                }
                
                Spacer()
            }.padding(.leading, 8)
                .padding(.top, 4)
                .foregroundColor(.black)
            
            //Likes label
            Text("\(post.likes) Likes")
                .font(.footnote)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10)
                .padding(.top, 1)
            
            //Caption label
            HStack{
                Text("\(post.user?.username ?? " ") ").fontWeight(.semibold) +
                Text(post.caption)
            }.frame(maxWidth: .infinity, alignment: .leading)
                .font(.footnote)
                .padding(.leading, 10)
                .padding(.top, 1)
            
            Text("6h ago")
                .font(.footnote)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10)
                .padding(.top, 1)
                .foregroundColor(.gray)
        }
    }
}

#Preview {
    FeedCell(post: Post.MOCK_POST[0])
}
