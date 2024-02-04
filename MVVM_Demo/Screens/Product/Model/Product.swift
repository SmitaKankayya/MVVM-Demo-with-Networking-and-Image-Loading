//
//  Product.swift
//  MVVM_Demo
//
//  Created by Smita Kankayya on 03/02/24.
//

import Foundation
struct Product :Decodable{
    let id: Int
    let title : String
    let price : Float
    let category : String
    let image : String
    let rating : Rating
}

struct Rating : Decodable{
    let rate : Float
    let count : Int
}
