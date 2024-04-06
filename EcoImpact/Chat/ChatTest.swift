//
//  ChatTest.swift
//  EcoImpact
//
//  Created by Othmane EL MARIKY on 2024-04-06.
//

import SwiftUI

struct ChatTest: View {
    var body: some View {
        ChatBubbles(text: "Hello, World!")
            .onAppear(perform: {
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                    
                }
            })
    }
}

#Preview {
    ChatTest()
}

struct ChatBubbles: View {
    @State var text: String
    var body: some View {
        Text(text)
            .font(.caption)
            .foregroundStyle(.white)
            .background {
                Capsule()
//                    .fill(.linearGradient(colors: [.appYellow, .green1, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .fill(.green1)
                    .frame(width: 200, height: 75)
            }
    }
}
