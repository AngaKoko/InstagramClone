//
//  SearchView.swift
//  InstagramClone
//
//  Created by Anga Koko on 14/07/2024.
//

import SwiftUI

struct SearchView: View {
    
    @State private var searchText = ""
    @StateObject var viewModel = SearchViewModel()

    var body: some View {
        NavigationStack {
            ScrollView{
                LazyVStack(spacing: 12){
                    ForEach (viewModel.users){ user in
                        NavigationLink(value: user){
                            HStack{
                                Image(user.profileUrl)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width:42, height:42)
                                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                
                                VStack(alignment: .leading){
                                    Text(user.username).fontWeight(.semibold)
                                    Text(user.fullName)
                                }.font(.footnote)
                                
                                Spacer()
                            }.padding(.horizontal)
                                .foregroundColor(.black)
                        }
                    }
                }.searchable(text: $searchText, prompt: "Search")
                    .padding(.top, 8)
            }
            .navigationDestination(for: User.self, destination: {user in ProfileView(user: user)
            })
            .navigationTitle("Explore")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    SearchView()
}
