//
//  test.swift
//  TestWokrApp
//
//  Created by Макар Тюрморезов on 14.06.2023.
//

import Foundation


func apiCall() {
    guard let url = URL(string: "http://restapi.adequateshop.com/api/authaccount/registration") else {
        return
    }
    var request = URLRequest(url: url)
    
    
    request.httpMethod = "Post"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    
    let body: [String: AnyHashable] = [
        "name" : "Adam",
        "email": "hello@mail.ru",
        "password": " ",
        
    ]
    request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
    
    let task = URLSession.shared.dataTask(with: request) { data, _, error in
        
        guard let data = data, error == nil else {
            return
        }
        do {
            let response = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
            print("SUCCESS \(response)")
        } catch {
            print(error)
            print("error is happened")
        }
    }
    task.resume()
}

struct Response: Codable {
    let name: String
    let email: String
    let password: String
}

