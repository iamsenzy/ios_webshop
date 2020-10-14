//
//  TabbarPresenter.swift
//  citychat
//
//  Created by Levente Vig on 2019. 07. 12..
//  Copyright (c) 2019. CodeYard. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class TabbarPresenter: NSObject {
    
    // MARK: - Public properties -

    // MARK: - Private properties -

    private unowned let view: TabbarViewInterface
    private let interactor: TabbarInteractorInterface
    private let wireframe: TabbarWireframeInterface
    private var selectedTab: Int = 0

    // MARK: - Lifecycle -

    init(view: TabbarViewInterface, interactor: TabbarInteractorInterface, wireframe: TabbarWireframeInterface, selectedTab: Int) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
        self.selectedTab = selectedTab
    }
}

// MARK: - Extensions -

extension TabbarPresenter: TabbarPresenterInterface {
    
    func viewDidLoad() {
        view.set(controllers: setupViewControllers())
        view.select(tab: selectedTab)
    }
    
    func setupViewControllers() -> [UIViewController] {
        let controllers: [UIViewController] = [
            HomeWireframe().viewController
        ]
        
        return controllers
    }
}
