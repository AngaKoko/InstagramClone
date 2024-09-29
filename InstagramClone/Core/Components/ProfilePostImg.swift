//
//  ProfilePostImg.swift
//  InstagramClone
//
//  Created by Anga Koko on 29/09/2024.
//

import SwiftUI

struct ProfilePostImg: ViewModifier {
    
    private let imagDimension : CGFloat = (UIScreen.main.bounds.width / 3 ) - 1
    
    func body(content: Content) -> some View {
        content
            .scaledToFill()
            .frame(width: imagDimension, height: imagDimension)
            .clipped()
    }
}

