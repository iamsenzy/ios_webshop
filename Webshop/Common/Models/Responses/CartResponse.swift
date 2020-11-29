//
//  CartResponse.swift
//  Webshop
//
//  Created by Geszti Bence on 2020. 11. 28..
//  Copyright © 2020. gesben. All rights reserved.
//

import Foundation
import ObjectMapper

class CartResponse: BaseResponse, Mappable {
    required init?(map: Map) {
        super.init()
        mapping(map: map)
    }
    
    required init(from decoder: Decoder) throws {
        super.init()
    }
    
    var status: Int?
    var cartId: Int?
    var message: String?
    
    func mapping(map: Map) {
        status <- map["status"]
        cartId <- map["cartId"]
        message <- map["message"]

    }
}
