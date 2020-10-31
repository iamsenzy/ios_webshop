//
//  DressResponse.swift
//  Webshop
//
//  Created by Geszti Bence on 2020. 10. 31..
//  Copyright © 2020. gesben. All rights reserved.
//

import Foundation
import ObjectMapper

class DressResponse: BaseResponse, Mappable {
    required init?(map: Map) {
        super.init()
        mapping(map: map)
    }
    
    required init(from decoder: Decoder) throws {
        super.init()
    }
    
    var status: Int?
    var data: [ProductModel]?
    var message: String?
    
    func mapping(map: Map) {
        status <- map["status"]
        data <- map["data"]
        message <- map["message"]

    }
}
