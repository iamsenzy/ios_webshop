//
//  UserManager.swift
//  Webshop
//
//  Created by Geszti Bence on 2020. 11. 21..
//  Copyright © 2020. gesben. All rights reserved.
//

import Foundation

final class UserManager {
    static let shared = UserManager()
    
    private init() {
        log.info("")
    }
    
    var loggedInUser: User? {
        didSet {
            UserDefaults.standard.set( loggedInUser?.id, forKey: Constants.UserDefaults.UserId)
            let logMessage = UserDefaults.standard.string(forKey: Constants.UserDefaults.UserId) ?? "No logged in user find"
            log.debug(logMessage)
            log.debug(loggedInUser?.cartId)
        }
    }
    
    func logout() {
        UserDefaults.resetStandardUserDefaults()
        loggedInUser = nil
    }
    
}
