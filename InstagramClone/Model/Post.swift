//
//  Post.swift
//  InstagramClone
//
//  Created by Anga Koko on 28/09/2024.
//

import Foundation

struct Post : Identifiable, Hashable, Codable {
    let id: String
    let ownerUid: String
    let caption: String
    var likes: Int = 0
    let imageUrl: String
    let timeStamp: Date
    var user: User?
}

extension Post{
    static var MOCK_POST: [Post] = [
        .init(id: "post1", ownerUid: "user1", caption: "I am batman",
              likes:1000, imageUrl: "bat-man-profile-pic-1", timeStamp: Date(),
              user: User.MOCK_USER[0]),
        .init(id: "post2", ownerUid: "user2", caption: "Let's put a smile on that face",
              likes:900, imageUrl: "bat-man-post-1", timeStamp: Date(),
              user: User.MOCK_USER[1]),
        .init(id: "post3", ownerUid: "user3", caption: "Wakanda forever",
              likes:9500, imageUrl: "bat-man-post-2", timeStamp: Date(),
              user: User.MOCK_USER[2]),
    ]
}
