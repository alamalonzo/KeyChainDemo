//
//  RepositoryDemo.swift
//  KeyChainDemo
//
//  Created by Alam Alonzo on 11/12/24.
//

import Foundation

struct RepositoryDemo {
    let appConfig = AppConfig.shared
    
    func recoverAlbertoMangas() async throws {
        let (data, _) = try await URLSession.shared.data(for: .demoRequest(appToken: appConfig.appToken, userToken: appConfig.userToken))
    }
    
    func loginUser() async throws{
        let (data, _) = try await URLSession.shared.data(for: URLRequest(url: URL(string: "User loggin")!))
        // if 201
        await KeychainManager.shared.storeKey(key: data, label: "token-Alberto")
        
        await KeychainManager.shared.deleteKey(label: "token-Maria")
    }
}

extension URLRequest {
    // URLRequest
    static func demoRequest(appToken: String?, userToken: String?) -> URLRequest {
        var request = URLRequest(url: URL(string: "asdf")!)
        request.setValue(appToken, forHTTPHeaderField: "App-Token")
        request.setValue(userToken, forHTTPHeaderField: "userToken")
        return request
    }
}
