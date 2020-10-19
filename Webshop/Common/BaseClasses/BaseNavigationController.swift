//
//  BaseNavigationController.swift
//  Template
//
//  Created by Levente Vig on 2019. 09. 21..
//  Copyright © 2019. levivig. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController, TabbarProtocol {
    
    var tabbarImage: UIImage?
    
    var selectedTabbarImage: UIImage?
    
    func setTabbarItem() {
        if let vctl = viewControllers.first as? BaseTabbarProtocolController {
                    vctl.setTabbarItem()
        }
        tabBarItem = viewControllers.first?.tabBarItem
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        view.backgroundColor = .clear
        navigationBar.tintColor = Colors.darkGray
        navigationController?.navigationBar.largeTitleTextAttributes = [ .foregroundColor: Colors.darkGray]
    }
}
