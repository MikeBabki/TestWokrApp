//
//  BeerModel.swift
//  TestWokrApp
//
//  Created by Макар Тюрморезов on 12.06.2023.
//

import Foundation

struct BeerModel: Decodable {
    
    var name: String?
    var first_brewed: String?
    var description: String?
    var image_url: String?
    var volume: Volume?
    var ingredients: Ingredients?
}
struct Volume: Decodable {
    
    var value: Int?
    var unit: String?
}

struct Ingredients: Decodable {
    
    var malt: [Malt]?
}

struct Malt: Decodable {
    
    var name: String?
    var amount: Amount?

}
struct Amount: Decodable {
    
    var value: Float?
    var unit: String?
}

//меняю модель и функцию которая инитится и по итогу дает модель
