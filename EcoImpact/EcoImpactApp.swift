//
//  EcoImpactApp.swift
//  EcoImpact
//
//  Created by Othmane EL MARIKY on 2024-04-04.
//

import SwiftUI
import Firebase

@main
struct EcoImpactApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            LogInAndSignUp()
        }
    }
}
