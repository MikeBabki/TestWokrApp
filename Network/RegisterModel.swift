//
//  RegisterModel.swift
//  TestWokrApp
//
//  Created by Макар Тюрморезов on 15.06.2023.
//

import Foundation


struct RegisterModel: Codable {

    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    
    let email: String
    let token: String

    enum CodingKeys: String, CodingKey {

        case email = "Email"
        case token = "Token"
    }
}
