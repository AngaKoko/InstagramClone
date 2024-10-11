//
//  ContentView.swift
//  InstagramClone
//
//  Created by Anga Koko on 03/03/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewViewModel()
    
    var body: some View {
        Group{
            if(viewModel.userSession == nil){
                LogInView()
            }else if let currentUser = viewModel.currentUser{
                MainTabView(currentUser: currentUser)
            }
        }
    }
}

#Preview {
    ContentView()
}
