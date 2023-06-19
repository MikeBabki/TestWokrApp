//
//  UserLoginRegistrationModel.swift
//  TestWokrApp
//
//  Created by Макар Тюрморезов on 14.06.2023.
//

import Foundation


struct UserLoginRegisterModel: Decodable {
    
    var data: [ProfileInformation]?
}
struct ProfileInformation: Decodable {
    
    var name: String?
    var token: String?
    
    private enum CodingKeys : String, CodingKey {
        case name = "Name", token = "Token"
    }
}
