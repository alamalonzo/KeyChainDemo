//
//  ContentView.swift
//  KeyChainDemo
//
//  Created by Alam Alonzo on 10/12/24.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("isUserLogged") var logged = false
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            Button("Logged") {
                logged.toggle()
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
    
    //antes
    func user() {
        UserDefaults.standard.set(26, forKey: "myAge")
        _ = UserDefaults.standard.integer(forKey: "myAge")
    }
}

#Preview {
    ContentView()
}
