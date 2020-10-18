//
//  UIView+Rounded.swift
//  Webshop
//
//  Created by Geszti Bence on 2020. 10. 17..
//  Copyright © 2020. GesBen. All rights reserved.
//

import UIKit

/**
 Helping variables and functions to UIView.
 */
extension UIView {

    /**
     The radius of the corner.
    */
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue
            
            // Don't touch the masksToBound property if a shadow is needed in addition to the cornerRadius
            if shadow == false {
                self.layer.masksToBounds = true
            }
        }
    }
    
    /**
     Create corner rounds of a view.
     
     - parameter corners: Represent the corners of the view
     - parameter radius: The radius of the corners
     */
    public func roundCorners(corners:UIRectCorner, radius: CGFloat) {
        self.layer.cornerRadius = 0.0
        DispatchQueue.main.async {
            let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
            let mask = CAShapeLayer()
            mask.path = path.cgPath
            self.layer.mask = mask
        }
    }

    /**
     Create circular corners to the view.
    */
    func makeCircleCorner() {
        self.layer.cornerRadius = self.frame.size.height / 2.0
    }
}

