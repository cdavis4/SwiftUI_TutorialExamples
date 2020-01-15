//
//  ProfileDetails.swift
//  Firebase_SwiftUI
//
//  Created by Carrie Davis on 1/13/20.
//  Copyright © 2020 Carrie Davis. All rights reserved.
//

import SwiftUI

struct ProfileDetails: View {
    
  //  @ObservedObject var session = FirebaseSession()

    var profile = Profile()
    
    var body: some View {
            HStack(alignment: .center, spacing: 20) {
                    Text(profile.firstname)
                    Text(profile.lastname)
                    Spacer()
                    VStack {
                        Text(profile.hasKids)
                        Text(profile.occupation)
                    }
                    }
                .padding()
            }
            
    }



//struct ProfileDetails_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileDetails(profile: profile)
//    }
//}
