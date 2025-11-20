//
//  HomePageView.swift
//  MovieMate
//
//  Created by Arianna Foo on 2025-11-20.
//

import SwiftUI

struct HomePageView: View {
    var body: some View {
        VStack {
            Text("Hello, welcome to the homepage")
                .bold()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.3), Color.white]),
                           startPoint: .top, endPoint: .bottom)
        )
    }
}

#Preview {
    HomePageView()
}
