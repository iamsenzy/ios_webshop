//
//  SearchInteractor.swift
//  Webshop
//
//  Created by Geszti Bence on 2020. 10. 17..
//  Copyright (c) 2020. GesBen. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import Foundation

final class SearchInteractor {
    private let dressProvider: DressService = RestClient.shared
}

// MARK: - Extensions -

extension SearchInteractor: SearchInteractorInterface {
    func getCategories(completion: @escaping CategoryLoaded) {
        dressProvider.getCategories { completion($0) }
    }
}
