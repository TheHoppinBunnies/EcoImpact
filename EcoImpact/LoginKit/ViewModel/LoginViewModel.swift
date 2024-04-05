//
//  LoginViewModel.swift
//  LoginKit
//
//  Created by Othmane EL MARIKY on 2023-09-04.
//

import SwiftUI
import Firebase

class LoginViewModel: ObservableObject {
    @Published var mobileNumber: String = ""
    @Published var optCode: String = ""
    
    @Published var CLIENT_CODE: String = ""
}
