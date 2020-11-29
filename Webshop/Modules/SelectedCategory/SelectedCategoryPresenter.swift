//
//  SelectedCategoryPresenter.swift
//  Webshop
//
//  Created by Geszti Bence on 2020. 10. 18..
//  Copyright (c) 2020. GesBen. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import Foundation
import UIKit

final class SelectedCategoryPresenter {

    // MARK: - Private properties -

    private unowned let view: SelectedCategoryViewInterface
    private let interactor: SelectedCategoryInteractorInterface
    private let wireframe: SelectedCategoryWireframeInterface
    
    private var products = Array.init(repeating: ProductModel(), count: 6)
    private var category: CategoryModel?

    // MARK: - Lifecycle -

    init(view: SelectedCategoryViewInterface, interactor: SelectedCategoryInteractorInterface, wireframe: SelectedCategoryWireframeInterface, category: CategoryModel? = nil) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
        self.category = category
    }
    
    func viewDidLoad() {
        
        interactor.getDressesByCategory(category: category?.id ?? 0) { [weak self] result in
            switch result {
            case .success(let dresses):
                self?.products = dresses.data ?? []
                self?.view.reload()
            case .failure(let error):
                log.debug(error.localizedDescription)
            }
        }
    }
}

// MARK: - Extensions -

extension SelectedCategoryPresenter: SelectedCategoryPresenterInterface {
    func getTitle() -> String? {
        category?.title
    }
    
    func setImageToModel(row: Int, image: UIImage) {
        products[row].image = image
    }
    
    func getProductsCount() -> Int {
        products.count
    }
    
    func getItem(_ row: Int) -> ProductModel {
        products[row]
    }
    
    func getItems() -> [ProductModel] {
        products
    }
    
    func itemSelected(_ row: Int) {
        wireframe.showSelectedProduct(product: products[row])
    }
    
}
