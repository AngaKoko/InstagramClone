//
//  RegistrationViewModel.swift
//  InstagramClone
//
//  Created by Anga Koko on 05/10/2024.
//

import Foundation

class RegistrationViewModel: ObservableObject {
    @Published var email = ""
    @Published var username = ""
    @Published var password = ""
    
    func clear(){
        self.email = ""
        self.password = ""
        self.username = ""
    }
    
    func createUser() async throws{
        try await AuthService.shared.createUser(email: email, password: password, username: username)
        clear()
    }
    
    func logInUser() async throws{
        try await AuthService.shared.logIn(withEmail: email, password: password)
        clear()
    }
}
