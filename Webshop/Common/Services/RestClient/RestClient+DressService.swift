//
//  RestClient+Dress.swift
//  Webshop
//
//  Created by Geszti Bence on 2020. 10. 31..
//  Copyright © 2020. gesben. All rights reserved.
//

import Foundation

protocol DressService: class {
    func getCategories(completion: @escaping CategoryLoaded)
    func getDresses(completion: @escaping DressesLoaded)
    func getDressesByCategory(category: Int ,completion: @escaping DressesLoaded)
}

extension RestClient: DressService {
    func getDressesByCategory(category: Int, completion: @escaping DressesLoaded) {
        let url = "\(Constants.baseURL)/dresses"
        request(url: url, method: .get, data: nil) { (result: Result<DressResponse, Error>) in
            completion(result)
        }
    }
    
    func getDresses(completion: @escaping DressesLoaded) {
        let url = "\(Constants.baseURL)/dresses"
        request(url: url, method: .get, data: nil) { (result: Result<DressResponse, Error>) in
            completion(result)
        }
    }
    
    func getCategories(completion: @escaping CategoryLoaded) {
        let url = "\(Constants.baseURL)/categories"
        request(url: url, method: .get, data: nil) { (result: Result<CategoryResponse, Error>) in
            completion(result)
        }
    }
    
}
