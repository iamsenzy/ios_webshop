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
}

// MARK: - Extensions -

extension SearchInteractor: SearchInteractorInterface {
    func getSearchCells(completion: @escaping ([SearchCellModel]) -> Void ) {
       var searchCells = [SearchCellModel(title: "Jacket"),
                          SearchCellModel(title: "Sweatshirt / Pullover"),
                          SearchCellModel(title: "Trousers"),
                          SearchCellModel(title: "Denim"),
                          SearchCellModel(title: "Accessories"),
                          SearchCellModel(title: "Shirt"),
                          SearchCellModel(title: "T-Shirt"),
                          SearchCellModel(title: "Shoes"),
                          SearchCellModel(title: "Shorts"),
                          SearchCellModel(title: "Sports"),
                          SearchCellModel(title: "Sportswear"),
                          SearchCellModel(title: "Beachwear"),
                          SearchCellModel(title: "Underwear & Socks")
       ]
        DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
            completion(searchCells)
        }
    }
}