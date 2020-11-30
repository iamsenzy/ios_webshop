//
//  String+Localization.swift
//  Webshop
//
//  Created by Geszti Bence on 2020. 11. 29..
//  Copyright © 2020. gesben. All rights reserved.
//

import Foundation

extension String {
    public func localizedWithComment(comment: String) -> String {
        NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: comment)
    }
    
    public var localized: String {
        NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
    
    public func localizeWithFormat(args: CVarArg...) -> String {
        String(format: self.localized, locale: nil, arguments: args)
    }
    
    public func localizeWithFormat(local: NSLocale?, args: CVarArg...) -> String {
        String(format: self.localized, locale: local as Locale?, arguments: args)
    }
}
