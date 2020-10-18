//
//  BaseNavigationController.swift
//  Template
//
//  Created by Levente Vig on 2019. 09. 21..
//  Copyright © 2019. levivig. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {
    
    init() {
        super.init(nibName: nil, bundle: nil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        view.backgroundColor = Colors.greenBlue
        //navigationBar.barTintColor = Colors.greenBlue
        //navigationBar.backgroundColor = Colors.greenBlue
        navigationBar.tintColor = Colors.softGray
        navigationController?.navigationBar.largeTitleTextAttributes = [ .foregroundColor: Colors.softGray]
        navigationController?.navigationBar.titleTextAttributes = [ .foregroundColor: Colors.softGray ]
        
        navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
    }
}
