//
//  Constants.swift
//
//  Copyright © 2020. gesben. All rights reserved.
//

import UIKit

//swiftlint:disable force_cast
let kAppDelegate = UIApplication.shared.delegate as! AppDelegate

struct Constants {
    
//    static let baseURL = "http://gesztibence-74380dcd.localhost.run" // public
    static let baseURL = "http://localhost:4040" // localhost
    
    struct UserDefaults {
        static let ApiKey = "ApiKey"
        static let UserId = "UserId"
    }
}
