//
//  AuthService.swift
//  InstagramClone
//
//  Created by Anga Koko on 04/10/2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreCombineSwift

class AuthService{
    
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    static let shared = AuthService()
    
    init() {
        Task{
            try await loadUserData()
        }
    }
    
    @MainActor
    func logIn(withEmail email: String, password: String)async throws {
        
        do{
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            try await loadUserData()
        }catch{
            print("Failed to sign in with error: \(error.localizedDescription)")
        }
        
    }
    
    @MainActor
    func createUser(email: String, password: String, username: String) async throws{
        do{
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            await uploadUser(userId: result.user.uid, email: email, username: username) 
        }catch{
            print("Failed to register user with error: \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func loadUserData() async throws{
        self.userSession = Auth.auth().currentUser
        guard let currentUid = userSession?.uid else {return}
        let snapshot = try await Firestore.firestore().collection("users").document(currentUid).getDocument()
        currentUser = try snapshot.data(as: User.self)
    }
    
    func signOut() throws{
        do{
            try Auth.auth().signOut()
            self.userSession = nil
        }catch{
            print("Error logging out user: \(error.localizedDescription)")
        }
    }
    
    func uploadUser(userId: String, email: String, username: String) async{
        let user = User(id: userId, username: username, email: email)
        guard let encodedUser = try? Firestore.Encoder().encode(user) else {return}
        try? await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
    }
}
 
