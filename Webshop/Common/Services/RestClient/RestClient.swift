//
//  RestClient.swift
//
//  Copyright © 2020. gesben. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper
import Foundation
import ObjectMapper

typealias CategoryLoaded = (Result<CategoryResponse, Error>) -> Void
typealias DressesLoaded = (Result<DressResponse, Error>) -> Void
typealias CartLoaded = (Result<DressResponse, Error>) -> Void
typealias ProfileLoaded = (Result<ProfileResponse, Error>) -> Void
typealias CartUpdated = (Result<CartResponse, Error>) -> Void

class RestClient {
    
    // MARK: Singleton
    static let shared = RestClient()
    private init() {
        log.info("")
    }
    
    // MARK: - Public properties -
    
    let baseURL: URL? = URL(string: Constants.baseURL)
    
    // MARK: - Private properties -
    
    private var headers: HTTPHeaders = [
        "Content-Type": "application/json"
    ]
    
    // MARK: - Requests -
    
    internal func request<T: Mappable>(url: String,
                                       method: HTTPMethod = .get,
                                       data: [String: Any]? = nil,
                                       completion: ((Result<T, Error>) -> Void)?) {
        
        if let apiKey = UserDefaults.standard.string(forKey: Constants.UserDefaults.ApiKey) {
            headers["x-api-key"] = apiKey
            log.debug("x-api-key: \(apiKey)")
        }
        
        log.debug(String(describing: data))
        
        AF.request(url,
                   method: method,
                   parameters: data,
                   encoding: JSONEncoding.default,
                   headers: self.headers)
            .responseObject { (response: DataResponse<T, AFError>) in
                print(response.debugDescription)
                switch response.result {
                case .success(let object):
                    if let data = response.data,let error = try? JSONDecoder().decode(APIError.self, from: data) {
                        completion?(Result.failure(error))
                    } else {
                        completion?(Result.success(object))
                    }
                case .failure(let error):
                    if let data = response.data,let apiError = try? JSONDecoder().decode(APIError.self, from: data) {
                        completion?(Result.failure(apiError))
                    } else {
                        completion?(Result.failure(error))
                    }
                }
        }
    }
    
    internal func request<T: Mappable>(url: String,
                                       method: HTTPMethod = .get,
                                       data: [String: Any]? = nil,
                                       completion: ((Result<[T], Error>) -> Void)?) {
        if let apiKey = UserDefaults.standard.string(forKey: Constants.UserDefaults.ApiKey) {
            headers["x-api-key"] = apiKey
            log.debug("x-api-key: \(apiKey)")
        }
        
        log.debug(String(describing: data))
        
        AF.request(url,
                   method: method,
                   parameters: data,
                   encoding: JSONEncoding.default,
                   headers: self.headers)
            .responseArray { (response: DataResponse<[T], AFError>) in
                print(response.debugDescription)

                switch response.result {
                case .success(let object):
                    if let data = response.data,let error = try? JSONDecoder().decode(APIError.self, from: data) {
                        completion?(Result.failure(error))
                    } else {
                        completion?(Result.success(object))
                    }
                case .failure(let error):
                    if let data = response.data,let apiError = try? JSONDecoder().decode(APIError.self, from: data) {
                        completion?(Result.failure(apiError))
                    } else {
                        completion?(Result.failure(error))
                    }
                }
        }
    }
}
