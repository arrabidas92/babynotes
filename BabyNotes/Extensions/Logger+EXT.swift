//
//  Logger+EXT.swift
//  BabyNotes
//
//  Created by Alexandre DUARTE on 10/04/2024.
//

import OSLog

extension Logger {
    private static var subsystem = Bundle.main.bundleIdentifier!
    
    static let viewCycle = Logger(subsystem: subsystem, category: "viewcycle")

    static let api = Logger(subsystem: subsystem, category: "API")
}
