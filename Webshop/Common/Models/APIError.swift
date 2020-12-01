//
//  APIError.swift
//
//  Copyright © 2020. gesben. All rights reserved.
//

import Foundation

class APIError: Codable, LocalizedError {
    
    // TODO: Modify according to API
    
    var name: String = ""
    var message: String = ""
    var code: Int = 0
    var type: String = ""
    
    var errorDescription: String? {
        return type
    }
}
