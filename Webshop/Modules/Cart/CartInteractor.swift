//
//  CartInteractor.swift
//  Webshop
//
//  Created by Geszti Bence on 2020. 11. 07..
//  Copyright (c) 2020. gesben. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import Foundation

final class CartInteractor {
    private var cartProvider: CartService = RestClient.shared
}

// MARK: - Extensions -

extension CartInteractor: CartInteractorInterface {
    func updateCart(customerId: Int, completion: @escaping CartUpdated) {
        cartProvider.updateCart(customerId: customerId) { completion($0) }
    }
    
    func getProducts(customerId: Int, completion: @escaping CartLoaded) {
        cartProvider.getProducts(customerId: customerId) { completion($0) }
    }
    
    func removeProduct(orderId: Int, completion: @escaping CartLoaded) {
        cartProvider.remove(orderId: orderId) { completion($0) }
    }
    
}
