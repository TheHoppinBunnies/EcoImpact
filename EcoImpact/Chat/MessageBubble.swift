//
//  MessageBubble.swift
//  EcoImpact
//
//  Created by Othmane EL MARIKY on 2024-04-27.
//

import SwiftUI

struct MessageBubble: View {
    var message: Message
    @State private var showTime = false
    
    var body: some View {
        VStack(alignment: message.received ? .leading : .trailing) {
            HStack {
                Text(message.text)
                    .padding()
                    .background(message.received ? Color(.light1) : Color(.blue))
                    .cornerRadius(30)
            }
            .frame(maxWidth: 300, alignment: message.received ? .leading : .trailing)
            .onTapGesture {
                showTime.toggle()
            }
            .frame(maxWidth: .infinity, alignment: message.received ? .leading : .trailing)
            .padding(message.received ? .leading : .trailing)
            .padding(.horizontal, 10)
        }
    }
}
