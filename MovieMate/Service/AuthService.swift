//
//  AuthService.swift
//  MovieMate
//
//  Created by Arianna Foo on 2025-11-20.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

final class AuthService {
    
    static let shared = AuthService()
    private init() { }
    
    private let auth = Auth.auth()
    private let db = Firestore.firestore()
    
    // MARK: - Sign Up User
    func signUpUser(
        email: String,
        password: String,
        fullName: String,
        completion: @escaping (Result<String, Error>) -> Void
    ) {
        auth.createUser(withEmail: email, password: password) { authResult, error in
            
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let uid = authResult?.user.uid else {
                completion(.failure(NSError(domain: "UIDError", code: 0)))
                return
            }
            
            // Save user info to Firestore
            let userData: [String: Any] = [
                "uid": uid,
                "email": email,
                "fullName": fullName,
                "createdAt": Date()
            ]
            
            self.db.collection("users").document(uid).setData(userData) { error in
                if let error = error {
                    completion(.failure(error))
                } else {
                    completion(.success(uid))
                }
            }
        }
    }
    
    // MARK: - Sign In
    func signInUser(
        email: String,
        password: String,
        completion: @escaping (Result<String, Error>) -> Void
    ) {
        auth.signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let uid = authResult?.user.uid else {
                completion(.failure(NSError(domain: "UIDError", code: 0)))
                return
            }
            
            completion(.success(uid))
        }
    }
    
    // MARK: - Sign Out
    func signOut(completion: @escaping (Bool) -> Void) {
        do {
            try auth.signOut()
            completion(true)
        } catch {
            print("❌ Sign-out error: \(error.localizedDescription)")
            completion(false)
        }
    }
}
