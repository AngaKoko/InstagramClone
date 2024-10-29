//
//  UserService.swift
//  InstagramClone
//
//  Created by Anga Koko on 17/10/2024.
//

import Foundation
import FirebaseFirestore

struct UserService{
    
    static func fetchAllUsers() async throws -> [User]{
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        return snapshot.documents.compactMap({try? $0.data(as: User.self)})
    }
}
