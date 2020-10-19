//
//  BaseTabbarProtocolController.swift
//  citychat
//
//  Created by Levente Vig on 2019. 07. 12..
//  Copyright © 2019. CodeYard. All rights reserved.
//

import UIKit

class BaseTabbarProtocolController: BaseViewController, TabbarProtocol {
    
    private(set) var tabbarImage: UIImage?
    private(set) var selectedTabbarImage: UIImage?
    private(set) var titleText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setTabbarItem() {
        tabBarItem = UITabBarItem(title: titleText,
                                  image: tabbarImage?.withRenderingMode(.alwaysOriginal),
                                  selectedImage: selectedTabbarImage?.withRenderingMode(.alwaysOriginal))
        tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
    }
}
