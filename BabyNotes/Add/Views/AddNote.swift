//
//  AddNote.swift
//  BabyNotes
//
//  Created by Alexandre DUARTE on 13/03/2024.
//

import SwiftUI

struct AddNote: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    @Binding var hasAddedRecentNote: Bool
    @State private var selectedCategory: Category? = nil
    @State private var noteTitle: String = ""
    @State private var noteContent: String = "Contenu"
    
    var body: some View {
        let _ = Self._printChanges()
        ZStack(alignment: .bottomTrailing) {
            VStack(alignment: .leading) {
                CategoryScrollView(
                    selectedCategory: $selectedCategory
                )
                .padding(.top, 8.0)
                TitleTextField(
                    placeholder: "Titre",
                    title: $noteTitle,
                    nbLimitCaracters: 50
                )
                .padding(.horizontal, 20.0)
                .padding(.top, 12.0)
                ContentTextEditor(
                    placeholder: "Contenu",
                    content: $noteContent
                )
                .padding(.horizontal, 16.0)
            }
        }
        .background(backgroundColor)
        .navigationTitle("Créer une note")
        .toolbar {
            ToolbarItem(placement: ToolbarItemPlacement.navigationBarTrailing) {
                ToolbarButton(label: "Sauvegarder", isDisabled: isDisabled) {
                    addNote()
                    hasAddedRecentNote = true
                    dismiss()
                }
            }
        }
    }
    
    private var backgroundColor: Color {
        if let selectedCategory = selectedCategory {
            return selectedCategory.colorName.color
        } else {
            return Color.white
        }
    }
    
    private var isDisabled: Bool {
        return selectedCategory == nil ||
        noteTitle.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ||
        noteContent.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
    
    private func addNote() {
        guard let category = selectedCategory else { return }
        
        let newNote = Note(
            title: noteTitle,
            content: noteContent,
            category: category
        )
        
        context.insert(newNote)
    }
}

#Preview {
    AddNote(hasAddedRecentNote: .constant(false))
}
