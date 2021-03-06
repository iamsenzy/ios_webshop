//
//  TabbarInterfaces.swift
//
//  Copyright (c) 2020. gesben. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

protocol TabbarWireframeInterface: WireframeInterface {
}

protocol TabbarViewInterface: ViewInterface {
    func set(controllers: [UIViewController])
    func select(tab: Int)
}

protocol TabbarPresenterInterface: PresenterInterface {
    func setupViewControllers() -> [UIViewController]
}

protocol TabbarInteractorInterface: InteractorInterface {
    func getProfile(profileId: Int, completion: @escaping  ProfileLoaded)
    func createCart(customerId: Int, completion: @escaping CartUpdated)
}
