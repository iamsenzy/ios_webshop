//
//  SearchCellModel.swift
//  Webshop
//
//  Created by Geszti Bence on 2020. 10. 17..
//  Copyright © 2020. GesBen. All rights reserved.
//

import Foundation
import ObjectMapper

class CategoryModel: NSObject, Mappable {
   
    var title: String?
    var imageUrl: String? = nil
    
    convenience init(title: String? = "", imageUrl: String? = "") {
        self.init()
        self.title = title
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
    }
    
}

extension CategoryModel: SearchCellBindable {
}

