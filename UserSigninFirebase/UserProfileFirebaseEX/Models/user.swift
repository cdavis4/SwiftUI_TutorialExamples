//
//  user.swift
//  Firebase_SwiftUI
//
//  Created by Carrie Davis on 1/12/20.
//  Copyright © 2020 Carrie Davis. All rights reserved.
//

import Foundation
class User {
    
    var uid: String
    var email: String?
    var displayName: String?
    
    init(uid: String, displayName: String?, email: String?) {
        self.uid = uid
        self.email = email
        self.displayName = displayName
    }
}
