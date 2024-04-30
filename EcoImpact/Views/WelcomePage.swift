//
//  WelcomePage.swift
//  EcoImpact
//
//  Created by zongyang on 2024-04-06.
//

import SceneKit
import SwiftUI

struct WelcomePage: View {
    @State var userName = "User"
    @State var scene: SCNScene? = .init(named: "earth.usdz")
    @State var goToChat = false
    
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.light1
                VStack {
                    Text("Welcome, \(userName)")
                        .font(.system(size: 40))
                        .fontWeight(.black)
                    CustomSceneView(scene: $scene)
                        .frame(height: 350)
                    Text("Welcome to EcoImpact!")
                    
                    GradientButton(title: "Start test", icon: "") {
                        goToChat.toggle()
                    }
                }
            }.ignoresSafeArea()
        }
        .fullScreenCover(isPresented: $goToChat, content: {
            ChatView()
        })
    }
}

#Preview {
    WelcomePage()
}



