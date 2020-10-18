//
//  ProductModel.swift
//  Webshop
//
//  Created by Geszti Bence on 2020. 10. 18..
//  Copyright © 2020. GesBen. All rights reserved.
//

import Foundation

class ProductModel {
    var title: String?
    var price: Int?
    var imageUrl: String?
    
    convenience init(title: String? = "",price: Int? = 0, imageUrl: String? = "") {
        self.init()
        self.title = title
        self.price = price
        self.imageUrl = imageUrl
    }
    
}

extension ProductModel: ProductCellBindable {
}
