//
//  TitleTextField.swift
//  BabyNotes
//
//  Created by Alexandre DUARTE on 19/03/2024.
//

import SwiftUI

struct TitleTextField: View {
    let placeholder: String
    @Binding var title: String
    let nbLimitCaracters: Int
    
    var body: some View {
        TextField("", text: $title, prompt: Text(placeholder), axis: .vertical)
            .lineLimit(1...2)
            .foregroundStyle(Color.black)
            .font(.title2)
            .onChange(of: title) { title = update(text: $1, nbLimit: nbLimitCaracters) }
            .onDisappear { title = "" }
    }
    
    private func update(text: String, nbLimit: Int) -> String {
        return String(
            text.prefix(nbLimit)
        )
    }
}
