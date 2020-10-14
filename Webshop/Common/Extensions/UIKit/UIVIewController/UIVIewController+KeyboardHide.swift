//
//  UIVIewController+KeyboardHide.swift
//  Webshop
//
//  Created by Geszti Bence on 2020. 10. 14..
//  Copyright © 2020. gesben. All rights reserved.
//

import UIKit

/**
 Helping variables and functions to UIView.
 */
extension UIViewController {
    
    /**
     Hide keyboard when tap a view.
     */
    public func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
}
