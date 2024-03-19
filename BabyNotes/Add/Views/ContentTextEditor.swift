//
//  ContentTextEditor.swift
//  BabyNotes
//
//  Created by Alexandre DUARTE on 19/03/2024.
//

import SwiftUI

struct ContentTextEditor: View {
    @Binding var content: String
    @FocusState private var isFocused: Bool
    
    var body: some View {
        TextEditor(text: $content)
            .focused($isFocused)
            .foregroundStyle(Color.gray)
            .font(.headline)
            .padding(.horizontal, 16.0)
            .onChange(of: isFocused) { updateContent(on: $1) }
    }
    
    func updateContent(on focus: Bool) {
        if focus {
            content = content == "Contenu" ? "" : content
        } else {
            let isContentEmpty = content.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
            content = isContentEmpty ? "Contenu" : content
        }
    }
}
