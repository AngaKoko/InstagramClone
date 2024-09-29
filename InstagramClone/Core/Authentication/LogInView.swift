//
//  LogInView.swift
//  InstagramClone
//
//  Created by Anga Koko on 14/07/2024.
//

import SwiftUI

struct LogInView: View {
    
    @State private var email = ""
    @State private var password = ""
    var body: some View {
        NavigationStack {
            VStack{
                
                Spacer()
                
                Image("app_text_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200)
                
                //Email Password View
                VStack{
                    TextField("Enter your email", text: $email)
                        .autocapitalization(.none)
                        .modifier(IGTextFieldModifier())
                    
                    SecureField("Enter your Password", text: $password)
                        .modifier(IGTextFieldModifier())
                }
            
                //Forgot Password view
                Button(action: {
                    print("Forgot passoword")
                }, label: {
                    Text("Forgot password?")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding()
                        .padding(.trailing, 24)
                }).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .trailing)
                
                //Log in View
                Button(action: {
                    print("Login")
                }, label: {
                    Text("Login")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 360, height: 44)
                        .background(Color(.systemBlue))
                        .cornerRadius(8)
                }).padding(.vertical)
                
                //Or View
                HStack{
                    Rectangle()
                        .frame(width: (UIScreen.main.bounds.width / 2) - 40, height: 0.5)
                    
                    Text("OR")
                    
                    Rectangle()
                        .frame(width: (UIScreen.main.bounds.width / 2) - 40, height: 0.5)
                    
                }.foregroundColor(.gray)
                
                HStack{
                    Image("face-book-logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                    Text("Login with facebook")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundColor(Color(.systemBlue))
                }.padding(.top, 8)
                
                Spacer()
                
                Divider()
                
                NavigationLink {
                    AddEmailView()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    HStack(spacing: 3){
                        Text("Don't have an account?")
                        Text("SignUp")
                            .fontWeight(.semibold)
                    }.font(.footnote)
                }.padding(.vertical, 16)

            }
        }
    }
}

#Preview {
    LogInView()
}
