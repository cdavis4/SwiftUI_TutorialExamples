//
//  FirebaseSession.swift
//  Firebase_SwiftUI
//
//  Created by Carrie Davis on 1/13/20.
//  Copyright © 2020 Carrie Davis. All rights reserved.
//

import Foundation
import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseDatabase

class FirebaseSession: ObservableObject {
    
    //MARK: Properties
    @Published var session: User?
    @Published var isLoggedIn: Bool?
    @Published var items: [Profile] = []

    var ref: DatabaseReference = Database.database().reference(withPath: "\(String(describing: Auth.auth().currentUser?.uid ?? "Error"))")
    
    //MARK: Functions
    func listen() {
        _ = Auth.auth().addStateDidChangeListener { (auth, user) in
            if let user = user {
                self.session = User(uid: user.uid, displayName: user.displayName, email: user.email)
                self.isLoggedIn = true
                self.getProfile()
            } else {
                self.isLoggedIn = false
                self.session = nil
            }
        }
    }
    
    func logIn(email: String, password: String, handler: @escaping AuthDataResultCallback) {
        Auth.auth().signIn(withEmail: email, password: password, completion: handler)
    }
    
    func logOut() {
            try! Auth.auth().signOut()
            self.isLoggedIn = false
            self.session = nil

    }
    
    func signUp(email: String, password: String, handler: @escaping AuthDataResultCallback) {
        Auth.auth().createUser(withEmail: email, password: password, completion: handler)
    }
    
    func getProfile() {
        ref.observe(DataEventType.value) { (snapshot) in
            self.items = []
            for child in snapshot.children {
                if let snapshot = child as? DataSnapshot,
                    let profile = Profile(snapshot: snapshot) {
                    self.items.append(profile)
                }
            }
        }
    }
    
    func uploadProfile(firstname: String, lastname: String, hasKids: String, hobbies: Array<String>, bodyType: String, occupation: String,city: String, state: String) {
        //Generates number going up as time goes on, sets order of TODO's by how old they are.
        let number = Int(Date.timeIntervalSinceReferenceDate * 1000)
        
        let postRef = ref.child(String(number))
        let post = Profile(firstname: firstname, lastname: lastname, hasKids: hasKids, hobbies: hobbies, bodyType: bodyType, occupation: occupation,city: city, state: state)
        postRef.setValue(post.toAnyObject())
    }
    
    func updateProfile(key: String, firstname: String, lastname: String, hasKids: String, hobbies: Array<String>, bodyType: String, occupation: String,city: String, state: String) {
        let update = ["firstname": firstname,"lastname": lastname,"hasKids": hasKids,"hobbies": hobbies,"bodyType": bodyType,"occupation": occupation,"city": city,"state": state] as [String : Any]
        let childUpdate = ["\(key)": update]
        ref.updateChildValues(childUpdate)
    }
    
}
