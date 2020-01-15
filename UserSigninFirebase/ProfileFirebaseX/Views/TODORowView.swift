//
//  TODORowView.swift
//  ProfileFirebaseX
//
//  Created by Carrie Davis on 1/14/20.
//  Copyright © 2020 Carrie Davis. All rights reserved.
//


import SwiftUI

struct TODORowView: View {
    
    var todo: TODOS
    
    var body: some View {
        HStack {
            Text(todo.todo)
            
            Spacer()
            
            if todo.isComplete == "true" {
                Image(systemName: "checkmark").imageScale(.medium)
            } else {
                Image(systemName: "xmark").imageScale(.medium)
            }
        }
    }
}
