//
//  ProductModel.swift
//  Webshop
//
//  Created by Geszti Bence on 2020. 10. 18..
//  Copyright © 2020. GesBen. All rights reserved.
//

import Foundation
import UIKit
import ObjectMapper

class ProductModel: NSObject, Mappable {
    var title: String?
    var desc: String?
    var price: Double?
    var imageUrl: String?
    var category: Int?
    var image: UIImage?
    
    convenience init(title: String? = "",price: Double? = 0, imageUrl: String? = "") {
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
        imageUrl <- map["url"]
    }
    
}

extension ProductModel: ProductCellBindable {
}
