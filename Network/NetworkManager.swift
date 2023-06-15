//
//  NetworkManager.swift
//  TestWokrApp
//
//  Created by Макар Тюрморезов on 12.06.2023.
//

import Foundation
import RNCryptor

var items = UserLoginRegisterModel()
class NetworkManager {
    
    func getResult(page: Int, totalCount: Int, completion: @escaping(Result<[BeerModel]?, Error>) -> Void) {
    
        var urlString = URLManager.beerURLCreator(page: page, totalCount: totalCount)
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
    //Request
    

//    func registerResponse() {
//
//        guard let url = URL(string: URLManager.profileRegister) else { return }
//        URLSession.shared.dataTask(with: url) { (data, res, err) in
//            do {
//                if let data = data {
//                    let result = try JSONDecoder().decode([UserLoginRegisterModel].self, from: data)
//                    DispatchQueue.main.async {
//                        self.items = result
//                    }
//                } else {
//                    print("No data")
//                }
//            } catch (let error) {
//                print(error.localizedDescription)
//            }
//
//
//
//        }.resume()
//    }

}





