//
//  BaseViewController.swift
//
//  Copyright © 2020. gesben. All rights reserved.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        if #available(iOS 13.0, *) {
            return .darkContent
        } else {
            return .default
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if #available(iOS 13.0, *) {
            overrideUserInterfaceStyle = .light
        }
        
        hideKeyboardWhenTappedAround()
        view.backgroundColor = .white
    }
}
