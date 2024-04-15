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
    @State private var model = Model()
     
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            VStack(alignment: .leading) {
                CategoryScrollView(
                    selectedCategory: $model.selectedCategory
                )
                .padding(.top, 8.0)
                TitleTextField(
                    placeholder: "Titre",
                    title: $model.noteTitle,
                    nbLimitCaracters: 50
                )
                .padding(.horizontal, 20.0)
                .padding(.top, 12.0)
                
                ContentTextEditor(
                    placeholder: "Contenu",
                    content: $model.noteContent
                )
                .padding(.horizontal, 16.0)
            }
        }
        .background(model.backgroundColor)
        .navigationTitle("Créer une note")
        .toolbar {
            ToolbarItem(placement: ToolbarItemPlacement.navigationBarTrailing) {
                Button {
                    model.addNote(from: context)
                    hasAddedRecentNote = true
                    dismiss()
                } label: {
                    Text("Sauvegarder")
                }
                .disabled(!model.noteCanBeSaved)
            }
        }
    }
}

#Preview {
    AddNote(hasAddedRecentNote: .constant(false))
}
