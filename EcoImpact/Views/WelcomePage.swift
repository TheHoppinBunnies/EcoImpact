//
//  WelcomePage.swift
//  EcoImpact
//
//  Created by zongyang on 2024-04-06.
//

import SceneKit
import SwiftUI

struct CustomSceneView: UIViewRepresentable {
    @Binding var scene: SCNScene?
    
    func makeUIView(context: Context) -> SCNView {
        let view = SCNView()
        view.allowsCameraControl = true
        view.autoenablesDefaultLighting = true
        view.antialiasingMode = .multisampling2X
        view.scene = scene
        view.backgroundColor = .clear
        return view
    }
    
    func updateUIView(_ uiView: SCNView, context: Context) {
        
    }
}

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



