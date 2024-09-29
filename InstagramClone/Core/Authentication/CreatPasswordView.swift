//
//  CreatPasswordView.swift
//  InstagramClone
//
//  Created by Anga Koko on 18/09/2024.
//

import SwiftUI

struct CreatPasswordView: View {
    @State private var password = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 12){
            Text("Create Password")
                .font(.title2)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .padding(.top)
            
            Text("You will use this email to sign into you account")
                .font(.footnote)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)
            
            SecureField("Enter your password", text: $password)
                .autocapitalization(.none)
                .modifier(IGTextFieldModifier())
            
            NavigationLink{
                CompleteSignupView()
                    .navigationBarBackButtonHidden()
            }label: {
                    Text("Next")
                    .modifier(IGButtonTextModifier())
            }.padding(.vertical)
            
            Spacer()
        }
        .toolbar{
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
    CreatPasswordView()
}
