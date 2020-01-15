//
//  NewTODOView.swift
//  ProfileFirebaseX
//
//  Created by Carrie Davis on 1/14/20.
//  Copyright © 2020 Carrie Davis. All rights reserved.
//

import SwiftUI

struct NewTODOView: View {
    
    @State private var newTODO = ""
    
    @ObservedObject var session = FirebaseSession()
    
    @Environment(\.presentationMode) var presentationMode
    
    
    var body: some View {
        Group {
            VStack {
                HStack {
                    Text("TODO:")
                    TextField("Enter TODO", text: $newTODO)
                        .padding()
                }
                Button(action: {
                    self.addTODO()
                }) {
                    Text("Add")
                }
            }
        }
        .padding()
    }
    
    func addTODO() {
        if !newTODO.isEmpty {
            //Add TODO to Firebase
            session.uploadTODO(todo: newTODO)
            dismiss()
        }
    }
    
    func dismiss() {
        presentationMode.wrappedValue.dismiss()
    }
}

struct NewTODOView_Previews: PreviewProvider {
    static var previews: some View {
        NewTODOView()
    }
}
