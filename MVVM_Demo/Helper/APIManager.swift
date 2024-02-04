//
//  APIManager.swift
//  MVVM_Demo
//
//  Created by Smita Kankayya on 03/02/24.
//

import Foundation

enum DataError: Error{
    case invalidResponse
    case invalidURL
    case invalidDecoding
    case network(Error?)
}

typealias Handler = (Result<[Product],DataError>)->Void //this is closure which has two parts response and error

final class APIManager{
    static let shared = APIManager()   //step1 - static
    private init(){}   //step 2- init block must be private
    
    
    func fetchProducts(completion: @escaping Handler){
        guard let url = URL(string: Constant.API.url) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data,error == nil else{
                completion(.failure(.invalidURL))
                return
            }
            guard let response = response as?
                    HTTPURLResponse,
                    200...299 ~= response.statusCode   //~= pattern matching operator //typecasting is doing to check the status code is successful or not
            else {
                completion(.failure(.invalidResponse))
                return
            }
            
            do{
                let products = try JSONDecoder().decode([Product].self, from: data)
                completion(.success(products))
            }catch{
                completion(.failure(.invalidDecoding))
            }
        }.resume()
        
    }
    
    
    
    
}

//helper class is a class which should not be inherited that time make class as final
//helper class multiple object should not be created.
//only one object should be created in helper class.
//Means helper class is singelton class.
//if not create init block private then outside we create object but i dont want multiple object that is why we make private init block


//typealise is keyword used to give name
