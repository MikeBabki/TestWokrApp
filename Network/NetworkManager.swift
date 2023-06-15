//
//  NetworkManager.swift
//  TestWokrApp
//
//  Created by Макар Тюрморезов on 12.06.2023.
//

import Foundation

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
    
    // Api Call for RegistrationView
    
    func registerApiCall(name: String, email: String, password: String, completion: @escaping(Result<RegisterModel?, Error>) -> Void) {
        guard let url = URL(string: "http://restapi.adequateshop.com/api/authaccount/registration") else {
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let body: [String: AnyHashable] = [
            "name" : email,
            "email": email,
            "password": password,
            
        ]
        request.httpBody = try? JSONSerialization.data(withJSONObject: body)
        
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            
            guard let data = data, error == nil else {
                return
            }
            do {
                let decodedData = try JSONDecoder().decode(RegisterModel.self, from: data)
                print(decodedData.data.token)
                let token = decodedData.data.token
                let service = ""
                KeychainManager.saveToken(token: token, service: service)
                completion(.success(decodedData))
            } catch {
                completion(.failure(error))
                print(error)
                print("error is happened")
            }
        }
        task.resume()
    }
}
