//
//  RestClient+CartService.swift
//  Webshop
//
//  Created by Geszti Bence on 2020. 11. 21..
//  Copyright © 2020. gesben. All rights reserved.
//

import Foundation

protocol CartService: class {
    func getProducts(customerId: Int, completion: @escaping CartLoaded )
    func add(data: DressData, completion: @escaping CartLoaded )
    func remove(orderId: Int, completion: @escaping CartLoaded )
}

extension RestClient: CartService {
    func add(data: DressData, completion: @escaping CartLoaded) {
        let url = "\(Constants.baseURL)/orders/"
        request(url: url, method: .post, data: data.dictionary ?? [:] ) { (result: Result<DressResponse, Error>) in
            completion(result)
        }
    }
    
    func remove(orderId: Int, completion: @escaping CartLoaded) {
        let url = "\(Constants.baseURL)/orders/\(orderId)"
        request(url: url, method: .delete, data: nil ) { (result: Result<DressResponse, Error>) in
            completion(result)
        }
    }
    
    func getProducts(customerId: Int, completion: @escaping CartLoaded) {
        let url = "\(Constants.baseURL)/cart/\(customerId)"
        request(url: url, method: .get, data: nil) { (result: Result<DressResponse, Error>) in
            completion(result)
        }
    }
}
