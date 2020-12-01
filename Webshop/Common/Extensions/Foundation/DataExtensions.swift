//
//  DataExtensions.swift
//
//  Copyright © 2020. gesben. All rights reserved.
//

import Foundation

extension Data {
    func tokenString() -> String {
        let parts = self.map { data in String(format: "%02.2hhx", data) }
        return parts.joined()
    }
}
