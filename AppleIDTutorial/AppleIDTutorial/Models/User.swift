//
//  User.swift
//  AppleIDTutorial
//
//  Created by Carrie Davis on 1/27/20.
//  Copyright © 2020 Carrie Davis. All rights reserved.
//


import Foundation
import Combine
import SwiftUI
class User: ObservableObject {
    @Published var userid = "userIdentifier"
    @Published var email = "email"
    @Published var displayName = ""
    @Published var fullName = ""
    
    //we can create a function here to send to user endpoint
   init(id: String, name: String, email: String) {
        self.userid = id
        self.email = email
        self.fullName = name
        
    }
  
}
