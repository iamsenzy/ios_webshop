//
//  SelectedCategoryWireframe.swift
//  Webshop
//
//  Created by Geszti Bence on 2020. 10. 18..
//  Copyright (c) 2020. GesBen. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class SelectedCategoryWireframe: BaseWireframe {

    // MARK: - Private properties -

    // MARK: - Module setup -

    init(category: CategoryModel? = nil) {
        let moduleViewController = SelectedCategoryViewController()
        super.init(viewController: moduleViewController)

        let interactor = SelectedCategoryInteractor()
        let presenter = SelectedCategoryPresenter(view: moduleViewController, interactor: interactor, wireframe: self, category: category)
        moduleViewController.presenter = presenter
    }

}

// MARK: - Extensions -

extension SelectedCategoryWireframe: SelectedCategoryWireframeInterface {
    func showSelectedProduct(product: ProductModel) {
        let wireframe = ProductWireframe(product: product)
        let vc = wireframe.viewController
        vc.hidesBottomBarWhenPushed = true
        navigationController?.pushWireframe(wireframe)
    }
    
}
