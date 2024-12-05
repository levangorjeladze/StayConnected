//
//  LoginViewModel.swift
//  StayConnected
//
//  Created by Levan Gorjeladze on 30.11.24.
//

import Foundation

class LoginViewModel {
    
    let authService = AuthService()

    func login(email: String, password: String, completion: @escaping (Bool) -> Void) {
        authService.login(username: email, password: password) { success in
            completion(success)
        }
    }
}
