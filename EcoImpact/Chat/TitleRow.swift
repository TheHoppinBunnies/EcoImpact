//
//  TitleRow.swift
//  EcoImpact
//
//  Created by Othmane EL MARIKY on 2024-04-27.
//

import SwiftUI

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
