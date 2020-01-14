//
//  ContentView.swift
//  HTTPRequestExample
//
//  Created by Carrie Davis on 1/14/20.
//  Copyright © 2020 Carrie Davis. All rights reserved.
//

import SwiftUI



struct ContentView: View {
    @State private var name = ""
    @State private var length = ""
    @State private var type = ""
    
    @ObservedObject var http = Http()
    @Environment(\.presentationMode) var presentationMode
     @State private var showingAlert = false
    
    var body: some View {
             Group {
                 VStack {
                    Text("Create Boat:")
                        .font(.title)
                        .padding()
                    HStack {
                        Text("Name:")
                        .font(.headline)
                        TextField("Boaty McBoatface", text: $name)
                                .padding()
                    }
                    HStack {
                        Text("Type:")
                        .font(.headline)
                        TextField("Catamaran", text: $type)
                            .padding()
                    }
                    HStack {
                        Text("Length: ")
                            .font(.headline)
                        TextField("32", text:$length)
                            .padding()
                            .cornerRadius(10)
                              .frame(alignment: .center)
                        
                                           
                    }
                   
                       
                     Button(action: {
                         self.addBoat()
                     }) {
                         Text("Add")
                         .foregroundColor(.white)
                        .font(.title)
                        .frame(width: 350, height: 60, alignment: .center)
                        .background(Color(red: 12.0 / 255.0, green: 121.0 / 255.0, blue: 150.0 / 255.0))
                        .cornerRadius(10)
                     }
                    
                 }
            
             }
             .padding()
       
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Results"), message: Text("Name: \(http.boatname) \n Type: \(http.boattype) \n Length: \(http.boatlength)"), dismissButton: .default(Text("Got it!")))
            }
         }
    
     func addBoat() {
        if !name.isEmpty || !type.isEmpty || !length.isEmpty {
         //convert length to int
            let intLength = Int(length)
            http.postBoat(name: name, type: type, length: intLength!)
            self.showingAlert = true
                dismiss()
            }
        }
        
        func dismiss() {
            presentationMode.wrappedValue.dismiss()
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
