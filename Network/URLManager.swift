//
//  URLManager.swift
//  TestWokrApp
//
//  Created by Макар Тюрморезов on 12.06.2023.
//

import Foundation


class URLManager {
    
    static let urlString = "https://api.punkapi.com/v2"
    static func beerURLCreator(page: Int, totalCount: Int) -> String {
        return urlString + "/beers?page=\(page)&per_page=\(totalCount)"
    }
    static let profileRegister = "http://restapi.adequateshop.com/api/authaccount/registration"
    static let profileLogin = "http://restapi.adequateshop.com/api/authaccount/login"
}

