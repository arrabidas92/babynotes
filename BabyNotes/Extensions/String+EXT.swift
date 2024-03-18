//
//  String+EXT.swift
//  BabyNotes
//
//  Created by Alexandre DUARTE on 18/03/2024.
//

import Foundation

extension String {
    var capitalizedFirstLetter: String {
        return prefix(1).uppercased() + dropFirst()
    }
}
