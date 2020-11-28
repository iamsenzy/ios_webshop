//
//  Regex.swift
//  Webshop
//
//  Created by Geszti Bence on 2020. 11. 22..
//  Copyright © 2020. gesben. All rights reserved.
//

import Foundation

struct Regex {
    
    static let Email = "[a-zA-Z0-9\\+\\.\\_\\%\\-\\+]{1,256}" +
        "\\@" +
        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
        "(" +
        "\\." +
        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
    ")+"
    
    static let PhoneNumber = "^[0-9]{11}$"
    static let PostNumber = "^[0-9]{4}$"
}
