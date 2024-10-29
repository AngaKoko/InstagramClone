//
//  User.swift
//  InstagramClone
//
//  Created by Anga Koko on 18/09/2024.
//

import Foundation
import FirebaseAuth

struct User: Identifiable, Hashable, Codable {
    let id: String
    var username: String
    var profileUrl: String = ""
    var fullName: String = ""
    var bio: String = ""
    let email: String
    
    var isCurrentUser: Bool {
        guard let currentUid = Auth.auth().currentUser?.uid else {return false}
        return currentUid == id
    }
}

extension User {
    static var MOCK_USER: [User] = [
        .init(id: NSUUID().uuidString, username: "batman", profileUrl: "bat-man-profile-pic-1", fullName:"Bruce Wayne", bio: "Ghattam night watch", email: "bruce@gmail.com"),
        .init(id: NSUUID().uuidString, username: "jocker", profileUrl: "bat-man-post-1", fullName:"Jocker Jocker", bio: "Ghattam Jocker", email: "jocker@gmail.com"),
        .init(id: NSUUID().uuidString, username: "spiderman", profileUrl: "bat-man-post-2", fullName:"Toby Mac", bio: "City Swinger", email: "spiderman@gmail.com"),
        .init(id: NSUUID().uuidString, username: "batman", profileUrl: "bat-man-post-3", fullName:"Bruce Wayne", bio: "Ghattam night watch", email: "bruce@gmail.com"),
        .init(id: NSUUID().uuidString, username: "batman", profileUrl: "bat-man-profile-pic-1", fullName:"Bruce Wayne", bio: "Ghattam night watch", email: "bruce@gmail.com"),
    ]
}
