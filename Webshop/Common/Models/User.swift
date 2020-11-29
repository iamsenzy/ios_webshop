//
//  User.swift
//  Webshop
//
//  Created by Geszti Bence on 2020. 11. 21..
//  Copyright © 2020. gesben. All rights reserved.
//

import Foundation
import ObjectMapper

class User: BaseResponse, Mappable, Encodable {
    required init?(map: Map) {
        super.init()
        mapping(map: map)
    }
    
    required init(from decoder: Decoder) throws {
        super.init()
    }
    
    override init() {
        super.init()
    }
    
    var id: Int?
    var name: String?
    var email: String?
    var phoneNumber: String?
    var postNumber: Int?
    var city: String?
    var address: String?
    
    var cartId: Int?
    
    func mapping(map: Map) {
        id <- map ["id"]
        name <- map ["name"]
        email <- map ["email"]
        phoneNumber <- map ["phoneNumber"]
        postNumber <- map ["postNumber"]
        city <- map ["city"]
        address <- map ["address"]
    }
}
