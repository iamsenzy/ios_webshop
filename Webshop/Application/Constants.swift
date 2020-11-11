//
//  Constants.swift
//  Template
//
//  Created by Levente Vig on 2019. 12. 22..
//  Copyright © 2019. levivig. All rights reserved.
//

import UIKit

//swiftlint:disable force_cast
let kAppDelegate = UIApplication.shared.delegate as! AppDelegate

struct Constants {
    
//    static let baseURL = "http://gesztibence-ceb1b1d7.localhost.run" // public
    static let baseURL = "http://localhost:4040" // localhost
    
    struct UserDefaults {
        static let ApiKey = "ApiKey"
    }
}
