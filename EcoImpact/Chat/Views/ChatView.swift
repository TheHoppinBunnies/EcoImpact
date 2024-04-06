//
//  ChatView.swift
//  EcoImpact
//
//  Created by Othmane EL MARIKY on 2024-04-06.
//

import SwiftUI

struct ChatView: View {
    
    var body: some View {
        VStack {
            VStack {
                TitleRow()
                
                ScrollViewReader { proxy in
                    ScrollView {
                        ForEach(sampleMessages, id: \.id) { message in
                            withAnimation(.spring(duration: 2)) {
                                MessageBubble(message: message)   
                            }
                        }
                    }
                    .padding(10)
                    .background(.white)
                    .cornerRadius(30, corners: [.topLeft, .topRight])
                }
                .ignoresSafeArea()
            }
            
            .background(.light1)
            
            MessageFielda()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}

var sampleMessages: [Message] {
    [ Message(id: "1", text: "Welcome to the chat! Answer to my questions in order to calculate your carbon footprint. Please answer in complete sentences for each questions. Please write a short paragraph to answer the questions after they have all been given. Please input answers for the questions one question at a time.", received: true),
      Message(id: "2", text: "1. What distance did you fly during the past year?", received: true),
      Message(id: "3", text: "2. Distance traveled by car during the past year.", received: true),
      Message(id: "4", text: "3. Distance traveled by public transport.", received: true),
      Message(id: "5", text: "4. What is your average energy consumption per month?", received: true),
      Message(id: "6", text: "5. How many kilograms of meat do you eat per week?", received: true),
      
    ]
}
