//
//  AddNote.swift
//  BabyNotes
//
//  Created by Alexandre DUARTE on 13/03/2024.
//

import SwiftUI

struct AddNote: View {
    private let mode: NoteMode
    
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    @Binding private var hasAddedRecentNote: Bool
    @State private var selectedCategory: Category? = nil
    @State private var noteTitle: String = ""
    @State private var noteContent: String = "Contenu"
    
    init(mode: NoteMode) {
        self.mode = mode
        
        switch mode {
        case .add(let hasAddedRecentNote):
            _hasAddedRecentNote = hasAddedRecentNote
        case .edit(let note):
            _hasAddedRecentNote = .constant(false)
            _selectedCategory = State(
                initialValue: Category(rawValue: note.idCategory)
            )
            
            _noteTitle = State(initialValue: note.title)
            _noteContent = State(initialValue: note.content)
        }
    }
    
    var body: some View {
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
        .navigationTitle(navigationTitle)
        .toolbar {
            switch mode {
            case .add:
                ToolbarItem(placement: .topBarTrailing) {
                    getSaveToolbarItem()
                }
            case .edit:
                ToolbarItem(placement: .topBarTrailing) {
                    getSaveToolbarItem()
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    ToolbarIconButton(
                        systemIcon: "trash",
                        isDisabled: false,
                        role: .destructive
                    ) {
                        deleteNote()
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    private func getSaveToolbarItem() -> ToolbarIconButton {
        ToolbarIconButton(
            systemIcon: "square.and.arrow.down",
            isDisabled: isDisabled,
            role: nil
        ) {
            saveNote()
        }
    }
    
    private var navigationTitle: String {
        switch mode {
        case .add:
            return "Créer une note"
        case .edit:
            return "Éditer une note"
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
    
    private func saveNote() {
        switch mode {
        case .add:
            addNote()
            hasAddedRecentNote = true
        case .edit(let note):
           updateNote(note)
        }
        
        dismiss()
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
    
    private func updateNote(_ note: Note) {
        guard let selectedCategory = selectedCategory else { return }
        
        note.update(title: noteTitle, content: noteContent, category: selectedCategory)
    }
    
    private func deleteNote() {
        switch mode {
        case .add:
            return
        case .edit(let note):
            context.delete(note)
            dismiss()
        }
    }
}

#Preview {
    AddNote(mode: .add(.constant(false)))
}
