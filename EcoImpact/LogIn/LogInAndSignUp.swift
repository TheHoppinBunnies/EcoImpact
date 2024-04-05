//
//  GlassMorphismCard.swift
//  Budgety
//
//  Created by Othmane EL MARIKY on 2023-09-17.
//

import SwiftUI
import Firebase
import GoogleSignIn
import GoogleSignInSwift
import AuthenticationServices
import FirebaseFirestore
import FirebaseStorage
import UIKit

struct LogInAndSignUp: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var logIn = true
    @State var showOTP: Bool = false
    @State var goToHome: Bool = false
    @State var errorMessage: String = ""
    @State var showError: Bool = false
    @ObservedObject var viewModel = CardsViewModel()
    @State var showNewUserView: Bool = false
    //    @ObservedObject var vm = SignInWithGoogle()
    
    var body: some View {
        VStack {
            VStack(spacing: 12, content: {
                Text(logIn ? "Welcome back!" : "Welcome!")
                    .font(.title.bold())
                
                VStack(alignment: .leading, spacing: 8, content: {
                    Text("Email")
                        .font(.callout.bold())
                    
                    CustomTF(hint: "username@example.com", value: $email)
                    
                    Text("Password")
                        .font(.callout.bold())
                        .padding(.top, 15)
                    
                    CustomTF(hint: "••••••••", value: $password, isPassword: true)
                    
                    if !logIn {
                        Text("Confirm Password")
                            .font(.callout.bold())
                            .padding(.top, 15)
                        
                        CustomTF(hint: "••••••••", value: $confirmPassword, isPassword: true)
                    }
                    
                    Button {
                        signInOrSignUpWithEmail()
                    } label: {
                        Text(logIn ? "Login": "Sign Up")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundStyle(.BGG)
                            .padding(.vertical, logIn ? 12: 8)
                            .frame(maxWidth: .infinity)
                            .background(email.isEmpty || password.isEmpty ? .white.opacity(0.6) : .white)
                            .clipShape(.rect(cornerRadius: 8, style: .continuous))
                    }
                    .padding(.top, 20)
                    .disabled(email.isEmpty || password.isEmpty)
                })
                
                HStack(spacing: 12, content: {
                    Button {
                        showOTP.toggle()
                    } label: {
                        Label("OTP", systemImage: "iphone.homebutton")
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, logIn ? 10 : 8)
                            .background {
                                TransparentBlurView(removeAllFilters: false)
                                    .background(.white.opacity(0.2))
                            }
                            .clipShape(.rect(cornerRadius: 8, style: .continuous))
                    }
                    
                    GoogleSignInButton(action: handleSignInButton)
//                        .overlay {
//                            Button {
//                                //
//                            } label: {
//                                Label("Google", image: "google")
//                                    .fontWeight(.semibold)
//                                    .frame(maxWidth: .infinity)
//                                    .padding(.vertical, logIn ? 10 : 8)
//                                    .background {
//                                        TransparentBlurView(removeAllFilters: false)
//                                            .background(.white.opacity(0.2))
//                                    }
//                                    .clipShape(.rect(cornerRadius: 8, style: .continuous))
//                            }
//                        }
                })
                .foregroundStyle(.white)
                .padding(.top, 15)
                
                Button {
                    if logIn {
                        email = ""
                        password = ""
                        confirmPassword = ""
                        logIn.toggle()
                    } else {
                        email = ""
                        password = ""
                        confirmPassword = ""
                        logIn.toggle()
                    }
                } label: {
                    Text(logIn ? "Don't have an account? Sign Up Now \(Image(systemName: "chevron.right.circle.fill"))" : "Already have an account? Log In Now \(Image(systemName: "chevron.right.circle.fill"))")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.caption.bold())
                        .foregroundStyle(.white)
                }
                
            })
            .padding(.horizontal, 30)
            .padding(.top, 35)
            .padding(.bottom, 25)
            .background {
                TransparentBlurView(removeAllFilters: true)
                    .blur(radius: 9, opaque: true)
                    .background(.white.opacity(0.05))
            }
            .clipShape(.rect(cornerRadius: 10, style: .continuous))
            .background {
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .stroke(.white.opacity(0.3), lineWidth: 1.5)
            }
            .shadow(color: .black.opacity(0.2), radius: 10)
            .padding(.horizontal, 40)
            .background {
                ZStack {
                    Circle()
                        .fill(.linearGradient(colors: [.gradient4, .gradient5], startPoint: .top, endPoint: .bottom))
                        .frame(width: 140, height: 140)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                        .offset(x: -25, y: -55)
                    
                    Circle()
                        .fill(.linearGradient(colors: [.gradient6, .gradient7], startPoint: .top, endPoint: .bottom))
                        .frame(width: 140, height: 140)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                        .offset(x: 25, y: 55)
                }
            }
        }
        .frame(maxWidth: 390)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background {
            Rectangle()
                .fill(.BGG)
                .ignoresSafeArea()
        }
        .sheet(isPresented: $showOTP, content: {
            if #available(iOS 16.4, *) {
                NavigationView {
                    Login()
                }
                .presentationDetents([.height(300)])
                .presentationCornerRadius(30)
            } else {
                NavigationView {
                    Login()
                }
                .presentationDetents([.height(300)])
            }
        })
        .preferredColorScheme(.dark)
        .fullScreenCover(isPresented: $goToHome) {
            //            DispatchQueue.main.async {
            NavigationView {
                Home()
                    .environmentObject(AuthViewModel())
                    .environmentObject(CardsViewModel())
            }
            //            }
            
        }
        .alert(isPresented: $showError) {
            Alert(title: Text("Oh Oh! There's an error!"), message: Text(errorMessage), dismissButton: .default(Text("OK")))
        }
        .fullScreenCover(isPresented: $showNewUserView) {
            NavigationView {
                Profile()
            }
        }
    }
    
    @ViewBuilder
    func CustomTF(hint: String, value: Binding<String>, isPassword: Bool = false) -> some View {
        Group {
            if isPassword {
                SecureField(hint, text: value)
            } else {
                TextField(hint, text: value)
            }
        }
        .padding(.vertical, logIn ? 10 : 5)
        .padding(.horizontal, 15)
        .background(.white.opacity(0.12))
        .clipShape(.rect(cornerRadius: 8, style: .continuous))
    }
    
    //    func signInWithGoogle() async {
    //        print("Hello")
    //        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
    //
    //        let config = GIDConfiguration(clientID: clientID)
    //        GIDSignIn.sharedInstance.configuration = config
    //
    //        guard let uid = Auth.auth().currentUser?.uid else { return }
    //        let ref = Storage.storage().reference(withPath: uid)
    //
    //        do {
    //            try await GIDSignIn.sharedInstance.signIn(withPresenting: Application_Utility.rootViewController)
    //
    ////            guard let user =
    //        } catch {
    //            print(error.localizedDescription)
    //            return
    //        }
    //
    //        GIDSignIn.sharedInstance.signIn(withPresenting: Application_Utility.rootViewController) { user, error in
    //            print("bonjour")
    //            if let error = error {
    //                print(error.localizedDescription)
    //                return
    //            }
    //
    //            guard let user = user?.user, let idToken = user.idToken else { return }
    //
    //            let accessToken = user.accessToken
    //
    //            let credential = GoogleAuthProvider.credential(withIDToken: idToken.tokenString, accessToken: accessToken.tokenString)
    //
    //            Auth.auth().signIn(with: credential) { res, error in
    //                do {
    //                    if let error = error {
    //                        print(error.localizedDescription)
    //                        return
    //                    }
    //
    //                    guard let user = res?.user else { return }
    //                    print(user)
    //                    guard let url = user.photoURL else { return }
    //
    //                    let imageData: Data = try Data(contentsOf: url)
    //
    //                    let db = Firestore.firestore()
    //                    let cardRef = db.collection("expenses").document(String(Auth.auth().currentUser!.uid))
    //                    let cardData: [String: Any] = [
    //                        "id": cardRef.documentID,
    //                        "name": user.displayName ?? "User",
    //                        "email": user.email ?? "username@example.com",
    //                        "imageURL": url.absoluteString,
    //                        "uid": String(Auth.auth().currentUser!.uid)
    //                    ]
    //
    //                    cardRef.setData(cardData) { (error) in
    //                        if let error = error {
    //                            print(error.localizedDescription)
    //                            return
    //                        }
    //                    }
    //
    //                    ref.putData(imageData, metadata: nil) { metadata, err in
    //                        if let err = err {
    //                            self.errorMessage = "Failed to push image to Storage: \(err)"
    //                            return
    //                        }
    //
    //                        ref.downloadURL { url, err in
    //                            if let err = err {
    //                                self.errorMessage = "Failed to retrieve downloadURL: \(err)"
    //                                return
    //                            }
    //
    //                            self.errorMessage = "Successfully stored image with url: \(url?.absoluteString ?? "")"
    //                            print(url?.absoluteString ?? "")
    //                        }
    //                    }
    //
    //                    DispatchQueue.main.async {
    //                        self.goToHome = true
    //                        print(self.goToHome)
    //                    }
    //                } catch {
    //                    print("HI")
    //                }
    //            }
    //        }
    //    }
    
    func handleSignInButton() {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
                
        // Create Google Sign In configuration object.
        let config = GIDConfiguration(clientID: clientID)
                
        GIDSignIn.sharedInstance.configuration = config
        GIDSignIn.sharedInstance.signIn(
            withPresenting: Application_Utility.rootViewController) { signInResult, error in
                guard let result = signInResult else {
                    // Inspect error
                    return
                }
                // If sign in succeeded, display the app's main content View.
                print("hello")
            }
    }
    
    func signInOrSignUpWithEmail() {
        if logIn {
            Auth.auth().signIn(withEmail: email, password: password) { _, error in
                if let error = error {
                    self.errorMessage = error.localizedDescription
                    self.showError = true
                } else {
                    self.goToHome = true
                }
            }
        } else if !logIn {
            if password == confirmPassword {
                Auth.auth().createUser(withEmail: email, password: confirmPassword) { _, error in
                    if let error = error {
                        self.errorMessage = error.localizedDescription
                        self.showError = true
                    } else {
                        self.showNewUserView = true
                    }
                }
            }
        }
    }
    
    //    func handleSignInButton() async {
    //        print("Hello")
    //        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
    //        let config = GIDConfiguration(clientID: clientID)
    //        GIDSignIn.sharedInstance.configuration = config
    //        guard let uid = Auth.auth().currentUser?.uid else { return }
    //        let ref = Storage.storage().reference(withPath: uid)
    //
    //        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
    //        guard let rootViewController = windowScene.windows.first?.rootViewController else { return }
    //
    //        do {
    //            let result = try await GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController)
    //            let gidUser = result.user
    //
    //            let idToken = gidUser.idToken?.tokenString
    //            let accessToken = gidUser.accessToken.tokenString
    //
    //            guard let idToken else { return }
    //
    //            let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: accessToken)
    //
    //            let authDataResult = try await Auth.auth().signIn(with: credential)
    //
    ////            guard let url = authDataResult.user.photoURL else { return }
    ////
    ////            let imageData: Data = try Data(contentsOf: url)
    ////
    ////            let db = Firestore.firestore()
    ////            let cardRef = db.collection("expenses").document(String(Auth.auth().currentUser!.uid))
    ////            let cardData: [String: Any] = [
    ////                "id": cardRef.documentID,
    ////                "name": authDataResult.user.displayName ?? "User",
    ////                "uid": String(Auth.auth().currentUser!.uid)
    ////            ]
    ////
    ////            cardRef.setData(cardData) { (error) in
    ////                if let error = error {
    ////                    print(error.localizedDescription)
    ////                    return
    ////                }
    ////            }
    ////
    ////            ref.putData(imageData, metadata: nil) { metadata, err in
    ////                if let err = err {
    ////                    self.errorMessage = "Failed to push image to Storage: \(err)"
    ////                    return
    ////                }
    ////
    ////                ref.downloadURL { url, err in
    ////                    if let err = err {
    ////                        self.errorMessage = "Failed to retrieve downloadURL: \(err)"
    ////                        return
    ////                    }
    ////
    ////                    self.errorMessage = "Successfully stored image with url: \(url?.absoluteString ?? "")"
    ////                    print(url?.absoluteString)
    ////                }
    ////            }
    //
    //            goToHome = true
    //
    //        } catch {
    //            errorMessage = error.localizedDescription
    //            showError = true
    //        }
    //    }
}

#Preview {
    LogInAndSignUp()
}
