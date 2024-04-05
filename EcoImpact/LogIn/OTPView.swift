//
//  Login.swift
//  Budgety
//
//  Created by Othmane EL MARIKY on 2023-09-04.
//

import SwiftUI
//import GoogleSignIn

//struct OTPView: View {
//    
////    @EnvironmentObject var otpModel: OTPViewModel
//    @FocusState var activeField: OTPField?
//    
//    var body: some View {
//        VStack {
//            OTPField()
//            
//            Button {
////                Task {
////                    await otpModel.verifyOTP()
////                }
//            } label: {
//                Text("Verify")
//                    .fontWeight(.semibold)
//                    .foregroundStyle(.white)
//                    .padding(.vertical, 12)
//                    .frame(maxWidth: .infinity)
//                    .background {
//                        RoundedRectangle(cornerRadius: 10, style: .continuous)
//                            .fill(.blue)
//                            .opacity(otpModel.isLoading ? 0 : 1)
//                    }
//                    .overlay {
//                        ProgressView()
//                            .opacity(otpModel.isLoading ? 1 : 0)
//                    }
//            }
//            .disabled(checkStates())
//            .opacity(checkStates() ? 0.4 : 1)
//            .padding(.vertical)
//            
//            HStack(spacing: 12) {
//                Text("Didn't get otp?")
//                    .font(.caption)
//                    .foregroundStyle(.gray)
//                
//                Button("Resend") {
//                    
//                }
//                .font(.callout)
//            }
//            .frame(maxWidth: .infinity, alignment: .leading)
//        }
//        .padding()
//        .frame(maxHeight: .infinity, alignment: .top)
//        .navigationTitle("OTP Code")
//        .onChange(of: otpModel.otpFields) { _, newValue in
//            OTPCondition(value: newValue)
//        }
////        .alert(errorMessage, isPresented: $showError) {
////            
////        }
//    }
//    
////    func checkStates() -> Bool {
////        for index in 0..<6 {
////            if otpModel.otpFields[index].isEmpty {
////                return true
////            }
////        }
////        
////        return false
////    }
//    
////    func OTPCondition(value: [String]) {
////        
////        for index in 0..<6 {
////            if value[index].count == 6 {
////                DispatchQueue.main.async {
////                    otpModel.otpText = value[index]
////                    otpModel.otpFields[index] = ""
////                    
////                    for item in otpModel.otpText.enumerated() {
////                        otpModel.otpFields[item.offset] = String(item.element)
////                    }
////                }
////                return
////            }
////        }
////        
////        for index in 0..<5 {
////            if value[index].count == 1 && activeStateForIndex(index: index) == activeField {
////                activeField = activeStateForIndex(index: index + 1)
////            }
////        }
////        
////        for index in 1...5 {
////            if value[index].isEmpty && !value[index - 1].isEmpty {
////                activeField = activeStateForIndex(index: index - 1)
////            }
////        }
////        
////        for index in 0..<6 {
////            if value[index].count > 1 {
////                otpModel.otpFields[index] = String(value[index].last!)
////            }
////        }
////    }
////    
////    @ViewBuilder
////    func OTPField() -> some View {
////        HStack(spacing: 14) {
////            ForEach(0..<6, id: \.self) { index in
////                VStack(spacing: 8) {
////                    TextField("", text: $otpModel.otpFields[index])
////                        .keyboardType(.numberPad)
////                        .textContentType(.oneTimeCode)
////                        .multilineTextAlignment(.center)
////                        .focused($activeField, equals: activeStateForIndex(index: index))
////                    
////                    Rectangle()
////                        .fill(activeField == activeStateForIndex(index: index) ? .blue : .gray.opacity(0.3))
////                        .frame(height: 4)
////                }
////                .frame(width: 40)
////            }
////        }
////    }
//    
////    func activeStateForIndex(index: Int) -> OTPField {
////        switch index {
////        case 0: return .field1
////        case 1: return .field2
////        case 2: return .field3
////        case 3: return .field4
////        case 4: return .field5
////        default: return .field6
////        }
////    }
//}
//
//enum OTPField {
//    case field1
//    case field2
//    case field3
//    case field4
//    case field5
//    case field6
//}

//struct Login: View {
////    @StateObject var otpModel: OTPViewModel = .init()
//    
//    var body: some View {
//        VStack {
//            HStack(spacing: 10) {
//                VStack(spacing: 8) {
//                    TextField("1", text: $otpModel.code)
//                        .keyboardType(.numberPad)
//                        .multilineTextAlignment(.center)
//                    
//                    Rectangle()
//                        .fill(otpModel.code == "" ? .gray.opacity(0.35) : .blue)
//                        .frame(height: 2)
//                }
//                .frame(width: 40)
//                
//                VStack(spacing: 8) {
//                    TextField("1234567890", text: $otpModel.number)
//                        .keyboardType(.numberPad)
//                    
//                    Rectangle()
//                        .fill(otpModel.number == "" ? .gray.opacity(0.35) : .blue)
//                        .frame(height: 2)
//                }
//            }
//            .padding(.vertical)
//            
//            Button {
//                Task {
//                    await otpModel.sendOTP()
//                }
//            } label: {
//                Text("Login With Phone")
//                    .fontWeight(.semibold)
//                    .foregroundStyle(.white)
//                    .padding(.vertical, 12)
//                    .frame(maxWidth: .infinity)
//                    .background {
//                        RoundedRectangle(cornerRadius: 10, style: .continuous)
//                            .fill(.blue)
//                            .opacity(otpModel.isLoading ? 0 : 1)
//                    }
//                    .overlay {
//                        ProgressView()
//                            .opacity(otpModel.isLoading ? 1 : 0)
//                    }
//            }
//            .disabled(otpModel.code == "" || otpModel.number == "")
//            .opacity(otpModel.code == "" || otpModel.number == "" ? 0.4 : 1)
//        }
//        .navigationTitle("Login With Phone")
//        .padding()
//        .frame(maxHeight: .infinity, alignment: .top)
//        .background {
//            NavigationLink(tag: "VERIFICATION", selection: $otpModel.navigationTag) {
//                OTPView()
//                    .environmentObject(otpModel)
//            } label: {
//                
//            }
//            .labelsHidden()
//        }
////        .alert(otpModel.vm.errorMessage, isPresented: $otpModel.vm.showError) {
////            
////        }
//    }
//}
//
//struct CustomTextFieldOTP: View {
//    
//    var hint: String
//    @Binding var text: String
//    @FocusState var isEnabled: Bool
//    var contentType: UITextContentType = .telephoneNumber
//    
//    var body: some View {
//        VStack(alignment: .leading, spacing: 15, content: {
//            TextField(hint, text: $text)
//                .keyboardType(.numberPad)
//                .textContentType(contentType)
//                .focused($isEnabled)
//            
//            ZStack(alignment: .leading) {
//                Rectangle()
//                    .fill(.black.opacity(0.2))
//                
//                Rectangle()
//                    .fill(.black)
//                    .frame(width: isEnabled ? nil : 0, alignment: .leading)
//                    .animation(.easeInOut(duration: 0.3), value: isEnabled)
//            }
//            .frame(height: 2)
//        })
//    }
//}
