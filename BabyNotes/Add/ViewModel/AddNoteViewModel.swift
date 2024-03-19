//
//  AddNoteViewModel.swift
//  BabyNotes
//
//  Created by Alexandre DUARTE on 19/03/2024.
//

import SwiftUI

extension AddNote {
    @Observable class ViewModel {
        var selectedCategory = Category.health
        var noteTitle: String = ""
        var noteContent: String = "Contenu"
    }
}
