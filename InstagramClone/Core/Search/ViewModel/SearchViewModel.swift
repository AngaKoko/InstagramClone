//
//  SearchViewModel.swift
//  InstagramClone
//
//  Created by Anga Koko on 17/10/2024.
//

import Foundation

class SearchViewModel: ObservableObject{
    
    @Published
    var users = [User]()
    
    init() {
        Task{
            try await fectAllUsers()
        }
    }
    
    @MainActor
    func fectAllUsers()async throws{
        users = try await UserService.fetchAllUsers()
    }
}
