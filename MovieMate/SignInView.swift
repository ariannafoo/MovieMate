//
//  SignInView.swift
//  MovieMate
//
//  Created by Arianna Foo on 2025-11-20.
//

import SwiftUI

struct SignInView: View {
    // TODO: let onSwitchToSignUp: () -> Void
    
    var body: some View {
        
        VStack {
            Text("Sign In")
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
                
                
                Button("Sign In") {
                    // TODO: handle sign in with Firebase
                }
                .buttonStyle(.borderedProminent)
                .frame(maxWidth: .infinity)
                .padding(.top, 8)
                

                // Footer prompt
                HStack(spacing: 4) {
                    Text("Don’t have an account?")
                    Button("Sign up") {
                        // TODO: onSwitchToSignUp()
                    }
                    .fontWeight(.semibold)
                }
                .frame(maxWidth: .infinity)
                .font(.footnote)
                
                
                Spacer()
            }
            .padding()
            .navigationBarBackButtonHidden(true)
        }
        

    } // Body
} // Struct


#Preview {
    SignInView()
}
