//
//  ProfileResponse.swift
//  Webshop
//
//  Created by Geszti Bence on 2020. 11. 21..
//  Copyright © 2020. gesben. All rights reserved.
//

import Foundation
import ObjectMapper

class ProfileResponse: BaseResponse, Mappable {
    required init?(map: Map) {
        super.init()
        mapping(map: map)
    }
    
    required init(from decoder: Decoder) throws {
        super.init()
    }
    
    var status: Int?
    var data: [User]?
    var userId: Int?
    var message: String?
    
    func mapping(map: Map) {
        status <- map["status"]
        data <- map["data"]
        userId <- map["userId"]
        message <- map["message"]

    }
}
