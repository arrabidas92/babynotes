//
//  AddNoteModel.swift
//  BabyNotes
//
//  Created by Alexandre DUARTE on 19/03/2024.
//

import SwiftUI
import SwiftData

extension AddNote {
    @Observable class Model {
        var selectedCategory: Category? = nil
        var noteTitle: String = ""
        var noteContent: String = "Contenu"
        
        var backgroundColor: Color {
            if let selectedCategory = selectedCategory {
                return selectedCategory.colorName.color
            } else {
                return Color.white
            }
        }
        
        var noteCanBeSaved: Bool {
            let hasTitle = !noteTitle.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
            let hasContent = !noteContent.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty && noteContent != "Contenu"
            let hasCategory = selectedCategory != nil
            return hasTitle && hasContent && hasCategory
        }
        
        func addNote(from context: ModelContext) {
            guard let category = selectedCategory else { return }
            
            let newNote = Note(
                title: noteTitle,
                content: noteContent,
                category: category
            )
            
            context.insert(newNote)
        }
    }
}
