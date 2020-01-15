//
//  ContentView.swift
//  ProfileFirebaseX
//
//  Created by Carrie Davis on 1/14/20.
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
                        NavigationLink(destination: NewTODOView()) {
                            Text("Add TODO")
                        }
                        
                        List {
                            ForEach(self.session.items) { todo in
                                NavigationLink(destination: TODODetailView(todo: todo)) {
                                    TODORowView(todo: todo)
                                }
                            }
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
            .navigationBarTitle(Text("TODO"))
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
