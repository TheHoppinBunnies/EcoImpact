//
//  ContentView.swift
//  EcoImpact
//
//  Created by Othmane EL MARIKY on 2024-04-06.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showSignup: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.light1.ignoresSafeArea()
                Login(showSignup: $showSignup)
                    .overlay {
                        CircleView()
                            .animation(.easeInOut(duration: 0.3), value: showSignup)
                    }
                    .navigationDestination(isPresented: $showSignup) {
                        ZStack {
                            Color.light1.ignoresSafeArea()
                            SignUp(showSignup: $showSignup)
                                .overlay {
                                    CircleView()
                                        .animation(.easeInOut(duration: 0.3), value: showSignup)
                                }
                        }.contentTransition(.opacity)
                    }
            }
        }
    }
    @ViewBuilder
    func CircleView() -> some View {
        Circle()
            .fill(.linearGradient(colors: [.appYellow, .green1, .blue], startPoint: .top, endPoint: .bottom))
            .frame(width: 200, height: 200)
        
            .offset(x: showSignup ? 90 : -90, y: -90)
            .blur(radius: 15)
            .hSpacing(showSignup ? .trailing : .leading)
            .vSpacing(.top)
    }
}

#Preview {
    ContentView()
}
