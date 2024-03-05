//
//  FeedView.swift
//  InstagramClone
//
//  Created by Anga Koko on 04/03/2024.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        NavigationStack {
            ScrollView{
                LazyVStack(spacing: 24){
                    ForEach(0 ... 10, id: \.self){
                        post in FeedCell()
                    }
                }
                .padding(.top, 8)
            }.navigationTitle("Feed")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar{
                    ToolbarItem(placement: .navigationBarLeading){
                        Image("app_text_logo")
                            .resizable()
                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 32)
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing){
                        Image(systemName: "paperplane")
                            .imageScale(.large)
                    }
                }
        }
    }
}

#Preview {
    FeedView()
}
