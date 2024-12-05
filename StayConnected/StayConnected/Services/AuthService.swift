//
//  AuthService.swift
//  StayConnected
//
//  Created by Levan Gorjeladze on 30.11.24.
//

import Foundation

class AuthService {
    
    func login(username: String, password: String, completion: @escaping (Bool) -> Void) {
        let parameters: [String: Any] = ["username": username, "password": password]
        
        NetworkService.shared.request(endpoint: "/api/login/", method: .post, parameters: parameters) { response in
            switch response {
            case .success(let data):
                guard let json = data as? [String: Any],
                      let accessToken = json["access"] as? String,
                      let refreshToken = json["refresh"] as? String else {
                    completion(false)
                    return
                }
                KeychainService.saveAccessToken(accessToken)
                KeychainService.saveRefreshToken(refreshToken)
                completion(true)
            case .failure:
                completion(false)
            }
        }
    }
}
