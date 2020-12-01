//
//  LoggerInitializer.swift
//  Template
//
//  Created by Levente Vig on 2019. 09. 21..
//  Copyright © 2019. levivig. All rights reserved.
//

import Foundation
import SwiftyBeaver

class LoggerInitializer: Initializable {
    func performInitialization() {
        let console = ConsoleDestination()
        log.addDestination(console)
    }
}
