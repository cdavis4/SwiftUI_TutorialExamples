//
//  ContentView.swift
//  Firebase_SwiftUI
//
//  Created by Carrie Davis on 1/12/20.
//  Copyright © 2020 Carrie Davis. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    
    //MARK: Properties
    @ObservedObject var session = FirebaseSession()
    
    var body: some View {
        
        NavigationView {
            Group {
                if session.session != nil {
                    VStack {
                        NavigationLink(destination: NewProfileView()) {
                            Text("Create Profile")
                        }
                        .navigationBarItems(trailing: Button(action: {
                            self.session.logOut()
                        }) {
                            Text("Logout")
                        })
                    }
                } else {
                    LoginView()
                    .navigationBarItems(trailing: Text(""))
                }
            }
            .onAppear(perform: getUser)
            .navigationBarTitle(Text("Profile"))
            .padding()
        }
    }
    
    //MARK: Functions
    func getUser() {
        session.listen()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
