//
//  KeyChainDemoApp.swift
//  KeyChainDemo
//
//  Created by Alam Alonzo on 10/12/24.
//

import SwiftUI

@main
struct KeyChainDemoApp: App {
    @AppStorage("isUserLogged") var logged = false
    
    var body: some Scene {
        WindowGroup {
            if logged {
                Text("User is Logged")
            } else {
                ContentView()                
            }
        }
    }
}
