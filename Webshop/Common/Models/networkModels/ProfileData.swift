//
//  ProfileData.swift
//  Webshop
//
//  Created by Geszti Bence on 2020. 11. 21..
//  Copyright © 2020. gesben. All rights reserved.
//

import Foundation

class ProfileData: Encodable {
    var name: String?
    var email: String?
    var phoneNumber: String?
    var postNumber: Int?
    var city: String?
    var address: String?
}
