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
   
    var id: Int?
    var title: String?
    
    convenience init(title: String? = "") {
        self.init()
        self.title = title
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
        id <- map["id"]
    }
    
}

extension CategoryModel: SearchCellBindable {
}

