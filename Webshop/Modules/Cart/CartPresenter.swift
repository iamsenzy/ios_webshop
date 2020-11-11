//
//  CartPresenter.swift
//  Webshop
//
//  Created by Geszti Bence on 2020. 11. 07..
//  Copyright (c) 2020. gesben. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import Foundation

final class CartPresenter {

    // MARK: - Private properties -

    private unowned let view: CartViewInterface
    private let interactor: CartInteractorInterface
    private let wireframe: CartWireframeInterface

    // MARK: - Lifecycle -

    init(view: CartViewInterface, interactor: CartInteractorInterface, wireframe: CartWireframeInterface) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
    }
}

// MARK: - Extensions -

extension CartPresenter: CartPresenterInterface {
}
