//
//  FontDelivery.swift
//  Webshop
//
//  Created by Geszti Bence on 2020. 10. 17..
//  Copyright © 2020. GesBen. All rights reserved.
//

import UIKit

@objcMembers class FontDeliver: NSObject {

    static func robotoFont(ofSize: CGFloat) -> UIFont {
        return UIFont(name: "Roboto-Regular", size: ofSize)!
    }

    static func mediumRobotoFont(ofSize: CGFloat) -> UIFont {
        return UIFont(name: "Roboto-Medium", size: ofSize)!
    }
    
    static func blackRobotoFont(ofSize: CGFloat) -> UIFont {
        return UIFont(name: "Roboto-Black", size: ofSize)!
    }

    static func boldRobotoFont(ofSize: CGFloat) -> UIFont {
        return UIFont(name: "Roboto-Bold", size: ofSize)!
    }

}
