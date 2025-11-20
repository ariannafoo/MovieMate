//
//  AuthView.swift
//  MovieMate
//
//  Created by Arianna Foo on 2025-11-20.
//

import SwiftUI

struct AuthView: View {
    
    var onAuthSuccess: (() -> Void)? = nil   // Parent sets this to switch to Home
    
    @State private var email = ""
    @State private var password = ""
    @State private var username = ""
    @State private var isSignUp = true
    @State private var emailError: String?
    @State private var passwordError: String?
    @State private var usernameError: String?
    @State private var authErrorMessage: String?
    
    var body: some View {
        VStack(spacing: 16) {
            Text(isSignUp ? "Sign Up" : "Sign In")
                .font(.title)
                .bold()
            
            VStack(alignment: .leading, spacing: 16) {
                // Email Input
                CustomTextField(
                    title: "Email Address",
                    text: $email,
                    placeholder: "e.g., account@email.com",
                    isSecure: false,
                    errorMessage: emailError,
                    onFocus: { emailError = nil }
                )

                // Password Input
                CustomTextField(
                    title: "Password",
                    text: $password,
                    placeholder: "e.g., Password123",
                    isSecure: true,
                    errorMessage: passwordError,
                    onFocus: { passwordError = nil }
                )

                // Username Input (Sign Up Only)
                if isSignUp {
                    CustomTextField(
                        title: "Full Name",
                        text: $username,
                        placeholder: "e.g., John Doe",
                        isSecure: false,
                        errorMessage: usernameError,
                        onFocus: { usernameError = nil }
                    )
                }

                // Sign-Up/Sign-In Button
                Button(action: {
                    validateFields()
                    if emailError == nil && passwordError == nil && (!isSignUp || usernameError == nil) {
                        if isSignUp {
                            signUp()
                        } else {
                            signIn()
                        }
                    }
                }) {
                    Text("Submit")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding(.top, 16)
            }
            .padding(.horizontal)
            
            HStack {
                Text(isSignUp ? "Already have an account?" : "Don't have an account?")
                    .foregroundColor(.gray)
                Button(action: {
                    isSignUp.toggle()
                }) {
                    Text(isSignUp ? "Sign In" : "Sign Up")
                        .foregroundColor(.blue)
                        .bold()
                }
            }

            .padding(.top, 10)
            
            Spacer()
        }
        .padding(.vertical)
    } // Body
    
    // MARK: Helper functions
    private func validateFields() {
        emailError = email.isEmpty ? "Email is required." : nil
        
        passwordError = password.isEmpty ? "Password is required." : (password.count < 7 ? "Password must be at least 7 characters." : nil)

        if isSignUp {
            usernameError = username.isEmpty ? "Username is required" : nil
        }
    }
    
    private func signIn() {
        AuthService.shared.signInUser(
            email: email,
            password: password
        ) { result in
            handleAuthResult(result)
        }
    }
    
    private func signUp() {
        AuthService.shared.signUpUser(
            email: email,
            password: password,
            fullName: username
        ) { result in
            handleAuthResult(result)
        }
    }
    
    private func handleAuthResult(_ result: Result<String, Error>) {
        switch result {
        case .success(let uid):
            print("✅ Auth success for uid: \(uid)")
            authErrorMessage = nil
            onAuthSuccess?()   // tells parent to show Home
            
        case .failure(let error):
            print("❌ Auth error: \(error.localizedDescription)")
            authErrorMessage = error.localizedDescription
        }
    }
} // Struct

#Preview {
    AuthView()
}
