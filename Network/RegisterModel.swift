//
//  RegisterModel.swift
//  TestWokrApp
//
//  Created by Макар Тюрморезов on 15.06.2023.
//

import Foundation


struct RegisterModel: Codable {
    let code: Int
    let message: String
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let id: Int
    let name, email, token: String

    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case name = "Name"
        case email = "Email"
        case token = "Token"
    }
}
