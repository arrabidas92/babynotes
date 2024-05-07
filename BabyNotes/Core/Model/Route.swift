//
//  Route.swift
//  BabyNotes
//
//  Created by Alexandre DUARTE on 10/04/2024.
//

import SwiftUI

enum Route: Hashable {
    case editNote
    case noteCategory(Category)
    case addNote
}
