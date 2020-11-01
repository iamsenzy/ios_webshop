//
//  Double+ToCurrency.swift
//  Webshop
//
//  Created by Geszti Bence on 2020. 11. 01..
//  Copyright © 2020. gesben. All rights reserved.
//

import Foundation

extension Double {
    func toCurrency() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return (numberFormatter.string(from: NSNumber(value: self)) ?? "") + " HUF"
    }
}
