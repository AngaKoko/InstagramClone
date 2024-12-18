//
//  ContentViewViewModel.swift
//  InstagramClone
//
//  Created by Anga Koko on 04/10/2024.
//

import Foundation
import FirebaseAuth
import Combine

class ContentViewViewModel: ObservableObject{
    
    private let service = AuthService.shared
    private var cancellables = Set<AnyCancellable>()
    
    @Published var userSession : FirebaseAuth.User?
    @Published var currentUser: User?
    
    init(){
        setUpSubscribers()
    }
    
    func setUpSubscribers(){
        service.$userSession.sink{[weak self] userSession in
            self?.userSession = userSession
        }.store(in: &cancellables)
        
        service.$currentUser.sink{[weak self] currentUser in
            self?.currentUser = currentUser
        }.store(in: &cancellables)
    }
}
