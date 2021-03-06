//
//  ProfileInteractor.swift
//  Webshop
//
//  Created by Geszti Bence on 2020. 11. 07..
//  Copyright (c) 2020. gesben. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import Foundation

final class ProfileInteractor {
    private var profileProvider: ProfileService = RestClient.shared
    private var cartProvider: CartService = RestClient.shared
}

// MARK: - Extensions -

extension ProfileInteractor: ProfileInteractorInterface {
    func createCart(customerId: Int, completion: @escaping CartUpdated) {
        cartProvider.createCart(customerId: customerId) { completion($0) }
    }
    
    func updateProfile(data: User, completion: @escaping  ProfileLoaded) {
        profileProvider.updateProfile(data: data) { completion($0) }
    }
    
    func getProfileByEmail(email: String, completion: @escaping ProfileLoaded) {
        profileProvider.getProfileByEmail(email: email) { completion($0) }
    }
    
    func createProfile(data: User, completion: @escaping ProfileLoaded) {
        profileProvider.createProfile(data: data) { completion($0) }
    }
    
    func getProfile(profileId: Int, completion: @escaping ProfileLoaded) {
        profileProvider.getProfile(profileId: profileId) { completion($0) }
    }
    
}
