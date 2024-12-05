//
//  KeychainService.swift
//  StayConnected
//
//  Created by Levan Gorjeladze on 05.12.24.
//

import Foundation
import Security

class KeychainService {
    
    static func saveAccessToken(_ token: String) {
        save(token: token, key: "access_token")
    }
    
    static func saveRefreshToken(_ token: String) {
        save(token: token, key: "refresh_token")
    }
    
    static func getAccessToken() -> String? {
        return getToken(forKey: "access_token")
    }
    
    static func getRefreshToken() -> String? {
        return getToken(forKey: "refresh_token")
    }
    
    static func save(token: String, key: String) {
        guard let data = token.data(using: .utf8) else { return }
        
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key,
            kSecValueData as String: data
        ]
        
        let status = SecItemAdd(query as CFDictionary, nil)
        if status != errSecSuccess {
            print("error rame")
        }
    }
    
    static func getToken(forKey key: String) -> String? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key,
            kSecReturnData as String: true,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]
        
        var result: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &result)
        
        guard status == errSecSuccess, let data = result as? Data,
              let token = String(data: data, encoding: .utf8) else {
            return nil
        }
        
        return token
    }
}
