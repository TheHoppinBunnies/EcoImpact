//
//  LoginKitApp.swift
//  LoginKit
//
//  Created by Othmane EL MARIKY on 2023-08-13.
//

import SwiftUI
import Firebase

@main
struct LoginKitApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
