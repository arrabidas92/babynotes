//
//  ContentTextEditor.swift
//  BabyNotes
//
//  Created by Alexandre DUARTE on 19/03/2024.
//

import SwiftUI

struct ContentTextEditor: View {
    let placeholder: String
    @Binding var content: String
    @FocusState private var isFocused: Bool
    
    var body: some View {
        TextEditor(text: $content)
            .focused($isFocused)
            .foregroundStyle(Color.black)
            .font(.headline)
            .onChange(of: isFocused) { updateContent(on: $1) }
            .scrollContentBackground(.hidden)
            .onDisappear { content = placeholder }
    }
    
    func updateContent(on focus: Bool) {
        if focus {
            content = content == placeholder ? "" : content
        } else {
            let isContentEmpty = content.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
            content = isContentEmpty ? placeholder : content
        }
    }
}
