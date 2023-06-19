//
//  NetworkManager.swift
//  TestWokrApp
//
//  Created by Макар Тюрморезов on 12.06.2023.
//

import Foundation
import SwiftyJSON

var registerModelInstance = DataClass()
var loginModelInstance = LoginData()
var beerModelInstance = [BeerModel]()

class NetworkManager {
    
    //MARK: - Api Call for beer catalog
    
    func getResult(page: Int, totalCount: Int, completion: @escaping(Result<[BeerModel]?, Error>) -> Void) {
        
        var urlString = URLManager.beerURLCreator(page: page, totalCount: totalCount)
        var url = URL(string: urlString)
        URLSession.shared.dataTask(with: url!) { data, _, error in
            guard let data = data else {
                completion(.failure(error!))
                return
            }
            do {
                
                let json = try! JSON(data: data)
                let arrayNames = json.arrayValue.map { itemJson in
                    return itemJson["name"].stringValue
                }
                
                let beerModels = json.arrayValue.map{
                    return  BeerModel(
                        name: $0["name"].stringValue,
                        description: $0["description"].stringValue,
                        image_url: $0["image_url"].stringValue
                    )
                }
                
                completion(.success(beerModels))
                
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    
    
//MARK: - Api Call for RegistrationView
    
    func registerApiCall(name: String, email: String, password: String, completion: @escaping(Result<DataClass?, Error>) -> Void) {
        guard let url = URL(string: URLManager.profileRegister) else {
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
                let json = try JSON(data: data)
                if let userName = json["data"]["Name"].string,
                   let token1 = json ["data"]["Token"].string
                {
                    let service = ""
                    KeychainManager.saveToken(token: token1, service: service)
                    registerModelInstance.email = userName
                    registerModelInstance.token = token1
                    completion(.success(registerModelInstance))
                    
                    print("Success in NetworkManager is happened")
                } else {
                    throw NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "invalid data"])
                }
                
            } catch {
                completion(.failure(error))
                print(error.localizedDescription)
                print("Error in NetworkManager - failure case")
            }
        }
        task.resume()
    }

    // MARK: - Api Call for LoginView
    
    func loginApiCall(email: String, password: String, completion: @escaping(Result<LoginData?, Error>) -> Void) {
        guard let url = URL(string: URLManager.profileLogin) else {
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let body: [String: AnyHashable] = [
            "email": email,
            "password": password,
        ]

        request.httpBody = try? JSONSerialization.data(withJSONObject: body)

        let task = URLSession.shared.dataTask(with: request) { data, _, error in

            guard let data = data, error == nil else {
                return
            }
            do {
                let json = try! JSON(data: data)
                if let userMail = json["data"]["Email"].string,
                   let token = json ["data"]["Token"].string
                {
                    let service = ""
                    KeychainManager.saveToken(token: token, service: service)
                    loginModelInstance.email = userMail
                    loginModelInstance.token = token
                    completion(.success(loginModelInstance))
                } else {
                    throw NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "invalid data"])
                }

            } catch {

                completion(.failure(error))
                print(error)
                print("error happen in login")
            }
        }
        task.resume()
    }
}

