//
//  SignUpViewModel.swift
//  StayConnected
//
//  Created by Levan Gorjeladze on 30.11.24.
//

import Foundation

class SignUpViewModel {

    func registerUser(username: String, password: String, completion: @escaping (Bool) -> Void) {
        AuthService().register(username: username, password: password, completion: completion)
    }
}
