//
//  CFResults.swift
//  EcoImpact
//
//  Created by zongyang on 2024-04-06.
//

import SwiftUI

struct CFResults: View {
    @AppStorage("emission") var emission = 0.0
    var body: some View {
        Text("\(String(format: "%0.2f", emission)) kg of CO2")
            .font(.title).bold()
        
        Text("Average: 16 000 kg of CO2")
    }
}

#Preview {
    CFResults()
}
