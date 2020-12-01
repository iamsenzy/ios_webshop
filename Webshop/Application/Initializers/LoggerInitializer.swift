//
//  LoggerInitializer.swift
//
//  Copyright © 2020. gesben. All rights reserved.
//

import Foundation
import SwiftyBeaver

class LoggerInitializer: Initializable {
    func performInitialization() {
        let console = ConsoleDestination()
        log.addDestination(console)
    }
}
