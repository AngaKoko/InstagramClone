//
//  FeedCell.swift
//  InstagramClone
//
//  Created by Anga Koko on 04/03/2024.
//

import SwiftUI

struct FeedCell: View {
    var body: some View {
        VStack{
            //Image + User name
            HStack{
                Image("ProfilePic")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                
                Text("Teddy_Koko")
                    .font(.footnote)
                    .fontWeight(.semibold)
                
                Spacer()
            }.padding(.leading)
            
            //Post image
            Image("bat-man-post-1")
                .resizable()
                .scaledToFit()
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
                    print("Like post")
                }label: {
                    Image(systemName: "bubble.right")
                        .imageScale(.large)
                }
                
                Button{
                    print("Like post")
                }label: {
                    Image(systemName: "paperplane")
                        .imageScale(.large)
                }
                
                Spacer()
            }.padding(.leading, 8)
                .padding(.top, 4)
                .foregroundColor(.black)
            
            //Likes label
            Text("23 Likes")
                .font(.footnote)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10)
                .padding(.top, 1)
            
            //Caption label
            HStack{
                Text("Teddy_Koko").fontWeight(.semibold) +
                Text("The new batman suit looks good. Going to be a great movie")
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
    FeedCell()
}
