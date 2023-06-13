//
//  NetworkManager.swift
//  TestWokrApp
//
//  Created by Макар Тюрморезов on 12.06.2023.
//

import Foundation

class NetworkManager {
    
    func getResult(page: Int, completion: @escaping(Result<[BeerModel]?, Error>) -> Void) {
    
        var urlString = URLManager.beerURLCreator(page: page)
        var url = URL(string: urlString)
        URLSession.shared.dataTask(with: url!) { data, _, error in
            guard let data = data else {
                completion(.failure(error!))
                return
            }
            do {
                let result = try JSONDecoder().decode([BeerModel].self, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
