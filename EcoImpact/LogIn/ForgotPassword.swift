//
//  ForgotPassword.swift
//  Budgety
//
//  Created by Othmane EL MARIKY on 2023-09-04.
//

import SwiftUI

struct ForgotPassword: View {
    
    @State private var emailID: String = ""
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Button(action: {
                dismiss()
            }, label: {
                Image(systemName: "arrow.left")
                    .font(.title2)
                    .foregroundStyle(.gray1)
            })
            .padding(.top, 10)
            
            Text("Forgot Password?")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .padding(.top, 5)
            
            Text("Please enter your email adress so we may send the reset link.")
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundStyle(.gray1)
                .padding(.top, -5)
            
            VStack(spacing: 25) {
                CustomTF(sfIcon: "at", hint: "Email ID", value: $emailID)
                
                GradientButton(title: "Send Link", icon: "arrow.right") {
                    dismiss()
                }
                .hSpacing(.trailing)
                .disableWithOpacity(emailID.isEmpty)
                
            }.padding(.top, 20)
        }
        .padding(.vertical, 15)
        .padding(.horizontal, 25)
        .interactiveDismissDisabled()
    }
}

#Preview {
    ContentView()
}

extension View {
    @ViewBuilder
    func hSpacing(_ alignment: Alignment = .center) -> some View {
        self
            .frame(maxWidth: .infinity, alignment: alignment)
    }
    
    @ViewBuilder
    func vSpacing(_ alignment: Alignment = .center) -> some View {
        self
            .frame(maxHeight: .infinity, alignment: alignment)
    }
    
    @ViewBuilder
    func disableWithOpacity(_ condition: Bool) -> some View {
        self
            .disabled(condition)
            .opacity(condition ? 0.5 : 1)
    }
}
