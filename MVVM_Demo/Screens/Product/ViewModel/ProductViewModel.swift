//
//  ProductViewModel.swift
//  MVVM_Demo
//
//  Created by Smita Kankayya on 03/02/24.
//

import Foundation

final class ProductViewModel{
    var products : [Product] = []
    var eventHandler : ((_ event : Event)->Void)?
    
    func fetchProducts(){
        self.eventHandler?(.loading)
        APIManager.shared.fetchProducts { response in
            self.eventHandler?(.stopLoading)
            
            switch response{
            case .success(let products):
                self.eventHandler?(.dataLoaded)
                self.products = products
            case .failure(let error):
                print(error)
                self.eventHandler?(.error((error)))
            }
        }
    }
}

extension ProductViewModel{
    enum  Event{
        case loading
        case stopLoading
        case dataLoaded
        case error(Error?)
    }
}
