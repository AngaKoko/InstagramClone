//
//  IGButtonTextModifier.swift
//  InstagramClone
//
//  Created by Anga Koko on 18/09/2024.
//

import SwiftUI

struct IGButtonTextModifier: ViewModifier{
    
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .fontWeight(.semibold)
            .foregroundColor(.white)
            .frame(width: 360, height: 44)
            .background(Color(.systemBlue))
            .cornerRadius(8)
    }
    
}
