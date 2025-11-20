//
//  SettingsView.swift
//  MovieMate
//
//  Created by Arianna Foo on 2025-11-20.
//

import SwiftUI

struct SettingsView: View {
    @Binding var isLoggedIn: Bool
    @State private var errorMessage = ""
    @State private var showSignOutConfirmation = false

    var body: some View {
        VStack(spacing: 16) {

            VStack(alignment: .leading, spacing: 8) {
                Text("User Information")
                    .font(.headline)
                    .padding(.bottom, 4)
                
                Text("Username: ariannafoo")
                    .font(.subheadline)
                
                Text("Email: ariannafoo40@gmail.com")
                    .font(.subheadline)
                

            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .background(Color(UIColor.systemGray6))
            .cornerRadius(16)

            Spacer()

            Button(action: {
                showSignOutConfirmation = true
            }) {
                Text("Sign Out")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .alert(isPresented: $showSignOutConfirmation) {
                Alert(
                    title: Text("Sign Out"),
                    message: Text("Are you sure you want to sign out?"),
                    primaryButton: .destructive(Text("Sign Out")) {
                        signOut()
                    },
                    secondaryButton: .cancel()
                )
            }

            if !errorMessage.isEmpty {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .padding(.top, 10)
            }
        }
        .padding()
        .background(
            LinearGradient(gradient: Gradient(colors: [Color.indigo.opacity(0.3), Color.white]),
                           startPoint: .top, endPoint: .bottom)
        )
    }
    
    private func signOut() {
        AuthService.shared.signOut { success in
            if success {
                isLoggedIn = false   // Go back to login screen
            }
        }
    }
}
