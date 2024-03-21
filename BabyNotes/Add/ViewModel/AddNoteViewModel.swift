//
//  AddNoteViewModel.swift
//  BabyNotes
//
//  Created by Alexandre DUARTE on 19/03/2024.
//

import SwiftUI

extension AddNote {
    @Observable class ViewModel {
        var selectedCategory: Category? = nil
        var noteTitle: String = ""
        var noteContent: String = "Contenu"
        
        var backgroundColor: Color {
            if let selectedCategory = selectedCategory {
                return selectedCategory.color
            } else {
                return Color.white
            }
        }
    }
}
