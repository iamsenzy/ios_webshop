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
}

extension RestClient: DressService {
    func getCategories(completion: @escaping CategoryLoaded) {
        let url = "\(Constants.baseURL)/categories"
        request(url: url, method: .get, data: nil) { (result: Result<CategoryResponse, Error>) in
            completion(result)
        }
    }
    
}
