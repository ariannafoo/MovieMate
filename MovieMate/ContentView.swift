//
//  ContentView.swift
//  MovieMate
//
//  Created by Arianna Foo on 2025-11-20.
//

import SwiftUI

struct ContentView: View {
    @State private var isLoggedIn = false // later: check Firebase user

    var body: some View {
        Group {
            if isLoggedIn {
                // show main app
                TabView {
                    HomePageView()
                        .tabItem {
                            Label("Home", systemImage: "house.fill")
                        }

                    SettingsView(isLoggedIn: $isLoggedIn)
                        .tabItem {
                            Label("Settings", systemImage: "gearshape.fill")
                        }
                }
            } else {
                // show auth screens
                AuthView(onAuthSuccess: {
                    isLoggedIn = true
                })
            }
        }
    }
}

#Preview {
    ContentView()
}
