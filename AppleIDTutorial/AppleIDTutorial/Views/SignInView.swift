//
//  SignInView.swift
//  AppleIDTutorial
//
//  Created by Carrie Davis on 1/27/20.
//  Copyright © 2020 Carrie Davis. All rights reserved.
//
import UIKit
import SwiftUI
import AuthenticationServices
import Combine

struct SignInView: View {
    @State private var displayName = ""
    @Environment(\.window) var window : UIWindow?
    @EnvironmentObject var signInWithAppleManager : SignInWithAppleManager
    @State private var isAlertPresented = false
    @State private var errorDescription = ""
    @State private var signInWithAppleDelegates : SignInWithAppleDelegates! = nil
    var body: some View {
        VStack {
            CircleLogo()
                .offset(x: 0, y: -130)
                .padding(.bottom, -130)
            Text("Sign Up")
                .font(.largeTitle)
                .padding()
            Text("Create an account to join the \n dating community! \n This account will allow you to \n contact potential matches.")
                .font(.headline)
                .foregroundColor(Color.gray)
                .multilineTextAlignment(.center)
                
                .padding()
            TextField("Enter Display Name Here ", text: $signInWithAppleManager.displayName)
              .edgesIgnoringSafeArea(.top)
                             .frame(width: 280, height: 60).textFieldStyle(RoundedBorderTextFieldStyle())
              .textContentType(.username)
              .autocapitalization(.none)
              .disableAutocorrection(true)
            AppleSignInButton()
            .edgesIgnoringSafeArea(.top)
                .frame(width: 280, height: 60)
                .onTapGesture(perform:self.showAppleLogin)
        }
        .frame(width: 350.0, height: 500.0)
    }
   private func showAppleLogin() {
       let request = ASAuthorizationAppleIDProvider().createRequest()
       request.requestedScopes = [.fullName, .email]

      performSignIn(using: [request])
     }
      private func performSignIn(using requests: [ASAuthorizationRequest]) {
        signInWithAppleDelegates = SignInWithAppleDelegates(window: window,
            onSignedIn: { (result) in
            switch result {
                case .success(let appleID):
                    self.signInWithAppleManager.isUserAuthenticated = .signedIn
                    print("userId[0] = \(appleID[0])")
                        print("userId[1] = \(appleID[1])")
                        print("userId[2] = \(appleID[2])")
                        UserDefaults.standard.set(appleID[0], forKey: self.signInWithAppleManager.userIdentifierKey)
                        UserDefaults.standard.set(appleID[1], forKey: self.signInWithAppleManager.email)
                        UserDefaults.standard.set(appleID[2], forKey: self.signInWithAppleManager.username)
                    self.signInWithAppleManager.isUserAuthenticated = .signedIn
                case .failure(let err):
                    self.errorDescription = err.localizedDescription
                    self.isAlertPresented = true
                    }
                })

                let controller = ASAuthorizationController(authorizationRequests: requests)
                controller.delegate = signInWithAppleDelegates
                controller.presentationContextProvider = signInWithAppleDelegates

        controller.performRequests()
    }

}
struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
