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

typealias Handler = (Result<[Product],DataError>)->Void

final class APIManager{
    static let shared = APIManager()
    private init(){}
    
    
    func fetchProducts(completion: @escaping Handler){
        guard let url = URL(string: Constant.API.url) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data,error == nil else{
                completion(.failure(.invalidURL))
                return
            }
            guard let response = response as?
                    HTTPURLResponse,
                  200...299 ~= response.statusCode
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

