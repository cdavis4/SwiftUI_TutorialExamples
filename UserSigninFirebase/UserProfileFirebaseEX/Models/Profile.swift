//
//  profile.swift
//  Firebase_SwiftUI
//
//  Created by Carrie Davis on 1/12/20.
//  Copyright © 2020 Carrie Davis. All rights reserved.
//


import SwiftUI
import FirebaseDatabase

class Profile: Identifiable,ObservableObject {
    
    let ref: DatabaseReference?
    let key: String
    let firstname: String
    let lastname: String
    let hasKids: String
    //let hobbies: Array<String>
    @Published var hobbies: [String] = []
    let bodyType: String
    let occupation: String
    let city: String
    let state: String
    let id: String
   
    init(){
        self.ref = nil
        self.key = ""
        self.firstname = ""
        self.lastname = ""
        self.hasKids = ""
        self.hobbies = []
        self.bodyType = ""
        self.occupation = ""
        self.city = ""
        self.state = ""
        self.id = key
    }
    
    init(firstname: String, lastname: String, hasKids: String, hobbies: Array<String>, bodyType: String, occupation: String,city: String, state: String, key: String = "") {
        self.ref = nil
        self.key = key
        self.firstname = firstname
        self.lastname = lastname
        self.hasKids = hasKids
        self.hobbies = hobbies
        self.bodyType = bodyType
        self.occupation = occupation
        self.city = city
        self.state = state
        self.id = key
        
    }
    
    init?(snapshot: DataSnapshot) {
        guard
            let value = snapshot.value as? [String: AnyObject],
            let firstname = value["firstname"] as? String,
            let lastname = value["lastname"] as? String,
            let hasKids = value["hasKids"] as? String,
            let hobbies = value["hobbies"] as? Array<String>,
            let bodyType = value["bodyType"] as? String,
            let occupation = value["occupation"] as? String,
            let city = value["city"] as? String,
            let state = value["state"] as? String
            else {
                return nil
            }
        
        self.ref = snapshot.ref
        self.key = snapshot.key
        self.firstname = firstname
        self.lastname = lastname
        self.hasKids = hasKids
        self.hobbies = hobbies
        self.bodyType = bodyType
        self.occupation = occupation
        self.city = city
        self.state = state
        self.id = snapshot.key
        
    }
    
    func toAnyObject() -> Any {
        return [
            "firstname": firstname,
            "lastname": lastname,
            "hasKids": hasKids,
            "hobbies": hobbies,
            "bodyType": bodyType,
            "occupation": occupation,
            "city": city,
            "state": state
        ]
    }
    
    
}
