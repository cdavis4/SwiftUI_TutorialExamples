//
//  NewProfileView.swift
//  Firebase_SwiftUI
//
//  Created by Carrie Davis on 1/13/20.
//  Copyright © 2020 Carrie Davis. All rights reserved.
//

import SwiftUI


struct NewProfileView: View {
   // @EnvironmentObject var profile: Profile
    @State private var firstname = " "
    @State private var lastname = " "
    @State private var bodytype = " "
    @State private var haskids = " "
    @State private var occupation = " "
    @State private var city = " "
    @State private var state = " "
    
    @ObservedObject var session = FirebaseSession()
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Group {
            VStack {
                HStack {
                    Text("First Name: ")
                    TextField("Enter First Name", text: $firstname)
                    .padding()
                    MultiSelectionView()
                }
            }
        }
    }
}
struct NewProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NewProfileView()
    }
}
