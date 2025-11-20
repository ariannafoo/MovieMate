//
//  CustomTextField.swift
//  MovieMate
//
//  Created by Arianna Foo on 2025-11-20.
//

import SwiftUI

struct CustomTextField: View {
    
    let title: String
    @Binding var text: String
    let placeholder: String
    let isSecure: Bool
    var errorMessage: String?
    var onFocus: (() -> Void)?
    var color: Color?
    
    @FocusState private var isFocused: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .foregroundColor(isFocused ? .blue : color)
                .padding(.horizontal, 4)
                .padding(.vertical, 8)
            
            if isSecure {
                SecureField(placeholder, text: $text)
                    .padding(12)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke((isFocused ? Color.blue : (errorMessage == nil ? color : Color.red)) ?? Color.gray, lineWidth: 1)
                    )
                    .focused($isFocused)
                    .onChange(of: text) {
                        onFocus?()
                    }
            } else {
                TextField(placeholder, text: $text)
                    .padding(12)
                    .autocapitalization(.none)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke((isFocused ? Color.blue : (errorMessage == nil ? color : Color.red)) ?? Color.gray, lineWidth: 1)
                    )
                    .focused($isFocused)
                    .onChange(of: text) {
                        onFocus?()
                    }
                
            }
            
            if let errorMessage = errorMessage, !errorMessage.isEmpty {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .padding(.horizontal, 4)
                    .padding(.top, 8)
            }
            
        }
        .animation(.easeInOut, value: isFocused)
    }
}
