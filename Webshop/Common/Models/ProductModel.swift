//
//  ProductModel.swift
//  Webshop
//
//  Created by Geszti Bence on 2020. 10. 18..
//  Copyright © 2020. GesBen. All rights reserved.
//

import Foundation
import ObjectMapper

class ProductModel: NSObject, Mappable {
    var title: String?
    var desc: String?
    var price: Int?
    var imageUrl: String?
    var category: Int?
    
    convenience init(title: String? = "",price: Int? = 0, imageUrl: String? = "") {
        self.init()
        self.title = title
        self.price = price
        self.imageUrl = imageUrl
    }
    
    override init() {
        super.init()
    }
    
    required init?(map: Map) {
        super.init()
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        title <- map["name"]
        desc <- map["description"]
        category <- map["category"]
        price <- map["price"]
    }
    
}

extension ProductModel: ProductCellBindable {
}
