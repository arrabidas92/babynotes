//
//  String+EXT.swift
//  BabyNotes
//
//  Created by Alexandre DUARTE on 18/03/2024.
//

import SwiftUI

extension String {
    var capitalizedFirstLetter: String {
        return prefix(1).uppercased() + dropFirst()
    }
    
    var color: Color {
        return Color(self)
    }
}
