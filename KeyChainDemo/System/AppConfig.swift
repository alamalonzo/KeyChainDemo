//
//  AppConfig.swift
//  KeyChainDemo
//
//  Created by Alam Alonzo on 11/12/24.
//

import Foundation


actor AppConfig {
    static let shared = AppConfig()
    private let manager = KeychainManager.shared
    
    var appToken: String?
    var userToken: String?
    
    private init() {
       Task {
           try? await recoverAppToken()
           
           await readUserToken()
       }
    }
    
    private func recoverAppToken() throws {
        guard let url = Bundle.main.url(forResource: "configAPI", withExtension: "plist") else { return }
        let data = try Data(contentsOf: url)
        let propertyDic = try PropertyListDecoder().decode([String:String].self, from: data)
        appToken = propertyDic["AppToken"]
    }
    
    private func readUserToken() async {
        guard let data = await manager.readKey(label: "userToken") else { return }
        userToken = String(data: data, encoding: .utf8)
    }
}
