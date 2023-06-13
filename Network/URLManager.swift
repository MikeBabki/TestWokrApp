//
//  URLManager.swift
//  TestWokrApp
//
//  Created by Макар Тюрморезов on 12.06.2023.
//

import Foundation


class URLManager {
    
    static let urlString = "https://api.punkapi.com/v2"
    static func beerURLCreator(page: Int) -> String {
        return urlString + "/beers?page=\(page)"
    }
}
