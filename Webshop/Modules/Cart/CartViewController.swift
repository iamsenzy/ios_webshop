//
//  CartViewController.swift
//  Webshop
//
//  Created by Geszti Bence on 2020. 11. 07..
//  Copyright (c) 2020. gesben. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class CartViewController: BaseTabbarProtocolController {

    // MARK: - Public properties -
    
    override var tabbarImage: UIImage? {
        UIImage(named: "cart")
    }
    
    override var selectedTabbarImage: UIImage? {
        UIImage(named: "cartGray")
    }

    var presenter: CartPresenterInterface!

    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title =  "Cart"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
        navigationController?.navigationBar.shadowImage = nil
        navigationController?.navigationBar.isTranslucent = true
    }

}

// MARK: - Extensions -

extension CartViewController: CartViewInterface {
}
