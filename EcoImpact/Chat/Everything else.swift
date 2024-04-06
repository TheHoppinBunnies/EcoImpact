//
//  Everything else.swift
//  EcoImpact
//
//  Created by Othmane EL MARIKY on 2024-04-06.
//

import SwiftUI
import Foundation

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
struct MessageFielda: View {    
    @State private var message = ""
    @AppStorage("flightDistance") var flight = 0.0
    @AppStorage("carDistance") var car = 0.0
    @AppStorage("publicDistance") var pTransport = 0.0
    @AppStorage("energyConsumption") var consumption = 0.0
    @AppStorage("meatKG") var meat = 0.0
    @AppStorage("emission") var emission = 0.0
    
    @State private var count = 0
    
    var body: some View {
        HStack {
            CustomTextField(placeholder: Text("Enter your message here"), text: $message)
                .frame(height: 52)
                .disableAutocorrection(true)
                .background(Color("Gray"))
            
            Button {
                if count == 1 {
                    flight = Double(message) ?? 0.0
                } else if count == 2 {
                    car = Double(message) ?? 0.0
                } else if count == 3 {
                    pTransport = Double(message) ?? 0.0
                } else if count == 4 {
                    consumption = Double(message) ?? 0.0
                } else if count == 5 {
                    meat = Double(message) ?? 0.0
                } else if count == 6 {
                    meat = Double(message) ?? 0.0
                    var hc = 0.0
                    let _ = HydroCarbon(consumption: consumption) { double, err in
                        hc = double ?? 0.0
                    }
                    
                    var fc = 0.0
                    let _ = FlightCarbon(distance: flight) { double, err in
                        fc = double ?? 0.0
                    }
                    
                    var cc = 0.0
                    
                    let _ = CarTravelCarbon(distance: car) { double, err in
                        cc = (double ?? 0.0) * 52
                    }
                    
                    var pc = 0.0
                    
                    let _ = PublicTransitCarbon(distance: pTransport) { double, err in
                        pc = (double ?? 0.0) * 52
                    }
                    
                    emission = (meat * 16.375 * 52) + hc + fc + cc + pc
                    
                }
                count += 1
                message = ""
            } label: {
                Image(systemName: "paperplane.fill")
                    .foregroundColor(.white)
                    .padding(10)
                    .background(Color(.green1))
                    .cornerRadius(50)
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
        .background(Color("Gray"))
        .cornerRadius(50)
        .padding()
    
    }
}


struct MessageField_Previews: PreviewProvider {
    static var previews: some View {
        MessageFielda()
    }
}


struct CustomTextField: View {
    var placeholder: Text
    @Binding var text: String
    var editingChanged: (Bool)->() = { _ in }
    var commit: ()->() = { }
    
    var body: some View {
        ZStack(alignment: .leading) {
            // If text is empty, show the placeholder on top of the TextField
            if text.isEmpty {
                placeholder
                    .opacity(0.5)
            }
            TextField("", text: $text, onEditingChanged: editingChanged, onCommit: commit)
        }
    }
}


struct TitleRow: View {
    var name = "Carbon Footprint Calculator"
    
    var body: some View {
        HStack(spacing: 20) {
           
                Image("rr").resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .cornerRadius(50)
            
            VStack(alignment: .leading) {
                Text(name)
                    .font(.title).bold()
                    .foregroundStyle(.green1)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding()
    }
}

struct TitleRow_Previews: PreviewProvider {
    static var previews: some View {
        TitleRow()
            .background(Color(.light1))
    }
}

struct Message: Identifiable, Codable {
    var id: String
    var text: String
    var received: Bool
}
