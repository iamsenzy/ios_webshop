//
//  UIView+Shadow.swift
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
     Boolean value of the shadow appearance to the view.
     */
    @IBInspectable var shadow: Bool {
        get {
            return layer.shadowOpacity > 0.0
        }
//        set {
//            if newValue == true {
//                self.addShadow()
//            }
//        }
    }
    
    /**
     Add shadow around the view.
     
     - parameter shadowColor: The color of the shadow
     - parameter shadowOffset: The offset of the shadow
     - parameter shadowOpacity: The opacity of the shadow
     - parameter shadowRadius: The radius of the shadow
     */
    public func addShadow(shadowColor: CGColor = UIColor.black.cgColor,
                          shadowOffset: CGSize = CGSize(width: 0.0, height: 1.0),
                          shadowOpacity: Float = 0.12,
                          shadowRadius: CGFloat = 1.0) {
        layer.masksToBounds = false
        layer.shadowColor = shadowColor
        layer.shadowOffset = shadowOffset
        layer.shadowOpacity = shadowOpacity
        layer.shadowRadius = shadowRadius
    }
    
    /// Add shadow layer to the view.
    ///
    /// - Parameters:
    ///   - color: Color of the shadow
    ///   - xOffset: X offset which will be use to the shadow.
    ///   - yOffset: Y offset which will be use to the shadow.
    ///   - blur: Use to set alpha and radius of the shadow.
    ///   - cornerRadius: Corner radius of the shadow.
    /// - Returns: A layer which applied the parameters.
    public func applyShadow( color: UIColor = .black, xOffset: CGFloat = 0, yOffset: CGFloat = 2, blur: Float = 4, cornerRadius: CGFloat = 0.0) -> CAShapeLayer {
        let layer = CAShapeLayer()
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = blur / 200.0
        layer.shadowOffset = CGSize(width: xOffset, height: yOffset)
        layer.shadowRadius = CGFloat(blur / 2.0)
        layer.path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
        layer.fillColor = self.backgroundColor?.cgColor
        
        layer.shadowPath = layer.path
        layer.name = "shadowLayer"
        return layer
    }
}

