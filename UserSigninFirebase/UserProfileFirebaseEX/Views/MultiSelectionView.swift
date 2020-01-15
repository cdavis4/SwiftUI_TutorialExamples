//
//  MultiSelectionView.swift
//  Firebase_SwiftUI
//
//  Created by Carrie Davis on 1/13/20.
//  Copyright © 2020 Carrie Davis. All rights reserved.
//

import SwiftUI
import Combine

struct MultiSelectionView: View {
    @State var items: [String] = ["Cooking", "Baking", "Reading", "Gaming", "Hiking", "Jogging/Running","Rock Climbing", "Skiing", "Basketball", "Sports", "Watching TV", "Football", "Crafting", "Art", "Bird Watching", "Dancing", "Baseball/Softball", "Soccer"]
    //@State var profile.hobbies: [String] = []
    @ObservedObject var profile = Profile()
    var body: some View {
        List {
            ForEach(self.items, id: \.self) { item in
                MultipleSelectionRow(title: item, isSelected: self.profile.hobbies.contains(item)) {
                    if self.profile.hobbies.contains(item) {
                        self.profile.hobbies.removeAll(where: { $0 == item })
                    }
                    else {
                        self.profile.hobbies.append(item)
                    }
                }
            }
        }
    }
    //.onAppear(perform: { self.selections = self.profile.hobbies})
    //.listStyle(GroupedListStyle())
    
}
struct MultipleSelectionRow: View {
    var title: String
    var isSelected: Bool
    var action: () -> Void

    var body: some View {
        Button(action: self.action) {
            HStack {
                Text(self.title)
                if self.isSelected {
                    Spacer()
                    Image(systemName: "checkmark")
                }
            }
        }
    }
}

struct MultiSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        
        MultiSelectionView()
    }
}


