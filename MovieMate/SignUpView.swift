//
//  SignUpView.swift
//  MovieMate
//
//  Created by Arianna Foo on 2025-11-20.
//

import SwiftUI

struct SignUpView: View {
    var body: some View {
        VStack(spacing: 24) {
            
            Text("Sign Up")
                .font(.largeTitle.bold())
            
            VStack(alignment: .leading, spacing: 10) {
                
                // Label
                Text("Email Address")
                // Email field
                TextField("e.g., johnsmith@email.com", text: .constant(""))
                    .padding(12)
                    .autocapitalization(.none)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                // Label
                Text("Password")
                // Password field
                SecureField("e.g., Password321!", text: .constant(""))
                    .padding(12)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                
                // Label
                Text("Full Name")
                // Password field
                SecureField("e.g., John Smith", text: .constant(""))
                    .padding(12)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                
                
                Button("Sign Up") {
                    // TODO: handle sign up with Firebase
                }
                .buttonStyle(.borderedProminent)
                .frame(maxWidth: .infinity)
                .padding(.top, 8)
                

                // Footer prompt
                HStack(spacing: 4) {
                    Text("Already have an account?")
                    Button("Sign in") {
                        // TODO: onSwitchToSignIn()
                    }
                    .fontWeight(.semibold)
                }
                .frame(maxWidth: .infinity)
                .font(.footnote)
                
                Spacer()
            }
            .padding()
            .navigationBarBackButtonHidden(true)
            
        } // VStack
    } // Body
} // Struct

#Preview {
    SignUpView()
}
