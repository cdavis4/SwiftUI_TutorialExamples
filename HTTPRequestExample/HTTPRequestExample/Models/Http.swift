//
//  Http.swift
//  HTTPRequestExample
//
//  Created by Carrie Davis on 1/14/20.
//  Copyright © 2020 Carrie Davis. All rights reserved.
//  model object that sends http request to boats

import SwiftUI
import Combine

struct BoatResponseModel: Codable {
    var name: String
    var id: Int
    var type: String
    var length: Int
}

final class Http: ObservableObject {
    

    @Published var completed = false
    @Published var boatname = ""
    @Published var boattype = ""
    @Published var boatlength = 0
    
  

    func postBoat(name: String, type: String, length: Int) {
        guard let url = URL(string: "https://cdavis4assignment5.appspot.com/boats") else { return }

        let body: [String: Any] = ["name": name, "type": type, "length": length]

        let finalBody = try! JSONSerialization.data(withJSONObject: body)

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = finalBody
        
        //set request headers
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
         guard let data = data else { return }
        
      
        let responseData = try! JSONDecoder().decode(BoatResponseModel.self, from: data)
            print("Response Data: \(responseData)")
            print("Response Data: \(responseData.name)")
            self.boatname = responseData.name
            self.boattype = responseData.type
            self.boatlength = responseData.length
           // if responseData.status == 200 {
                DispatchQueue.main.async {
                    self.completed = true
         //       }
            }
        }
            task.resume()
    }
}
