//
//  UserStatView.swift
//  InstagramClone
//
//  Created by Anga Koko on 04/03/2024.
//

import SwiftUI

struct UserStatView: View {
    
    let value: String
    let title: String
    var body: some View {
        VStack{
            Text(value)
                .font(.subheadline)
                .fontWeight(.semibold)
            
            Text(title)
                .font(.footnote)
        }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    UserStatView(value: "3K", title: "Posts")
}
