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
    @State private var vm = ViewModel()
     
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            VStack(alignment: .leading) {
                CategoryScrollView(
                    selectedCategory: $vm.selectedCategory
                )
                .padding(.top, 8.0)
                TitleTextField(
                    placeholder: "Titre",
                    title: $vm.noteTitle,
                    nbLimitCaracters: 50
                )
                .padding(.horizontal, 20.0)
                .padding(.top, 12.0)
                
                ContentTextEditor(
                    placeholder: "Contenu",
                    content: $vm.noteContent
                )
                .padding(.horizontal, 16.0)
            }
        }
        .background(vm.backgroundColor)
        .navigationTitle("Créer une note")
        .toolbar {
            ToolbarItem(placement: ToolbarItemPlacement.navigationBarTrailing) {
                Button {
                    vm.addNote()
                    hasAddedRecentNote = true
                    dismiss()
                } label: {
                    Text("Sauvegarder")
                }
                .disabled(!vm.noteCanBeSaved)
            }
        }
    }
}

#Preview {
    AddNote(hasAddedRecentNote: .constant(false))
}
