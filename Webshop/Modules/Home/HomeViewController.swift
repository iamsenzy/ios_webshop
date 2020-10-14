//
//  HomeViewController.swift
//  Webshop
//
//  Created by Geszti Bence on 2020. 10. 14..
//  Copyright (c) 2020. GesBen. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class HomeViewController: BaseViewController {

    private var tableView: UITableView!
    
    // MARK: - Public properties -

    var presenter: HomePresenterInterface!

    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    private func setup() {
        initNavigation()
        initTableView()
    }
    
    private func initNavigation() {
        title = "B My Webshop"
    }
    
    private func initTableView() {
        tableView = UITableView()
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

}

// MARK: - Extensions -

extension HomeViewController: HomeViewInterface {
}
