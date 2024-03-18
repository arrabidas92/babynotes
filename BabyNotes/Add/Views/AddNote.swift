//
//  AddNote.swift
//  BabyNotes
//
//  Created by Alexandre DUARTE on 13/03/2024.
//

import SwiftUI

struct AddNote: View {
    @State private var selectedCategory = Category.health
    @State private var noteTitle: String = ""
    @State private var noteContent: String = "Contenu"
    @FocusState private var isFocused: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            //Replace with text editor for title to have multi line titles
            TextField(
                "",
                text: $noteTitle,
                prompt:
                    Text("Titre")
                    .foregroundStyle(Color.gray)
            )
            .foregroundStyle(Color.black)
            .font(.title2)
            .padding(.horizontal, 20.0)
            .lineLimit(nil)
            
            TextEditor(text: $noteContent)
                .focused($isFocused)
                .foregroundStyle(Color.gray)
                .font(.headline)
                .padding(.horizontal, 16.0)
                .onChange(of: isFocused) { _, isFocused in
                    if isFocused {
                        noteContent = ""
                    } else if noteContent.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                        noteContent = "Contenu"
                    }
                }
        }
        .navigationTitle("Add a note")
        .toolbar {
            ToolbarItem(placement: ToolbarItemPlacement.navigationBarTrailing) {
                Picker("Category", selection: $selectedCategory) {
                    ForEach(Category.allCases, id: \.self) { category in
                        Text(category.title)
                    }
                }
                .pickerStyle(.automatic)
            }
        }
    }
}

#Preview {
    AddNote()
}
