//
//  SearchCellModel.swift
//  Webshop
//
//  Created by Geszti Bence on 2020. 10. 17..
//  Copyright © 2020. GesBen. All rights reserved.
//

import Foundation

class SearchCellModel {
    var title: String?
    var imageUrl: String?
    
    convenience init(title: String? = "", imageUrl: String? = "") {
        self.init()
        self.title = title
        self.imageUrl = imageUrl
    }
    
}

extension SearchCellModel: SearchCellBindable {
}

