//
//  TabbarProtocol.swift
//
//  Copyright © 2020. gesben. All rights reserved.
//

import UIKit

protocol TabbarProtocol {
    var tabbarImage: UIImage? { get }
    var selectedTabbarImage: UIImage? { get }
    
    func setTabbarItem()
}
