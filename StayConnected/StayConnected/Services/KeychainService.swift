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
        return getToken(key: "access_token")
    }
    
    static func getRefreshToken() -> String? {
        return getToken(key: "refresh_token")
    }
    
    private static func save(token: String, key: String) {
        let data = token.data(using: .utf8)!
        
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key,
            kSecValueData as String: data
        ]
        
        SecItemDelete(query as CFDictionary)
        let status = SecItemAdd(query as CFDictionary, nil)
        
        if status != errSecSuccess {
            print("keychain failed status: \(status)")
        }
    }
    
    private static func getToken(key: String) -> String? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key,
            kSecReturnData as String: true,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]
        
        var item: CFTypeRef?
        let status = SecItemCopyMatching(query as CFDictionary, &item)
        
        if status == errSecSuccess, let data = item as? Data, let token = String(data: data, encoding: .utf8) {
            return token
        } else {
            return nil
        }
    }
}
