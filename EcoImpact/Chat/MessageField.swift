//
//  Everything else.swift
//  EcoImpact
//
//  Created by Othmane EL MARIKY on 2024-04-06.
//

import SwiftUI
import Foundation

struct MessageField: View {
    @State private var message = ""
    @AppStorage("flightDistance") var flight = 0.0
    @AppStorage("carDistance") var car = 0.0
    @AppStorage("publicDistance") var pTransport = 0.0
    @AppStorage("energyConsumption") var consumption = 0.0
    @AppStorage("meatKG") var meat = 0.0
    @AppStorage("emission") var emission = 0.0
    
    @State private var count = 1
    @State var goToFinal = false
    
    var body: some View {
        HStack {
            CustomTextField(placeholder: Text("Enter your message here"), text: $message)
                .frame(height: 52)
                .disableAutocorrection(true)
                .background(Color(.light1))
            
            Button {
                if count == 1 {
                    flight = Double(message) ?? 0.0
                    print(flight)
                } else if count == 2 {
                    car = Double(message) ?? 0.0
                } else if count == 3 {
                    pTransport = Double(message) ?? 0.0
                } else if count == 4 {
                    consumption = Double(message) ?? 0.0
                } else if count == 5 {
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
                    
                    print(meat + hc + fc + cc + pc)
                    
                    emission = (meat * 16.375 * 52) + hc + fc + cc + pc
                    
                    goToFinal = true
                    
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
        .fullScreenCover(isPresented: $goToFinal, content: {
            ResultsPage()
        })
    
    }
}


struct MessageField_Previews: PreviewProvider {
    static var previews: some View {
        MessageField()
    }
}


struct Message: Identifiable, Codable {
    var id: String
    var text: String
    var received: Bool
}
