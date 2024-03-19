//
//  TitleTextField.swift
//  BabyNotes
//
//  Created by Alexandre DUARTE on 19/03/2024.
//

import SwiftUI

struct TitleTextField: View {
    @Binding var title: String
    var nbLimitCaracters: Int
    
    var body: some View {
        TextField("", text: $title, prompt: Text("Titre"), axis: .vertical)
            .lineLimit(1...2)
            .foregroundStyle(Color.black)
            .font(.title2)
            .padding(
                EdgeInsets(
                    top: 16.0,
                    leading: 20.0,
                    bottom: 0.0,
                    trailing: 20.0
                )
            )
            .onChange(of: title) { title = update(text: $1, nbLimit: nbLimitCaracters) }
    }
    
    private func update(text: String, nbLimit: Int) -> String {
        return String(
            text.prefix(nbLimit)
        )
    }
}
