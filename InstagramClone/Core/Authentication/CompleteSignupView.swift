//
//  CompleteSignupView.swift
//  InstagramClone
//
//  Created by Anga Koko on 18/09/2024.
//

import SwiftUI

struct CompleteSignupView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 12){
            Text("Welcome to Instagram")
                .font(.title2)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .padding(.top)
            
            Text("You will use this username to sign into you account")
                .font(.footnote)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)
            
            Button{
                print("Complete sign up")
            }label: {
                    Text("Complete Signup")
                    .modifier(IGButtonTextModifier())
            }.padding(.vertical)
            
        }.toolbar{
            ToolbarItem(placement: .navigationBarLeading){
                Image(systemName: "chevron.left")
                    .imageScale(.large)
                    .onTapGesture {
                        dismiss()
                    }
            }
        }
    }
}

#Preview {
    CompleteSignupView()
}
