//
//  NoteCard.swift
//  BabyNotes
//
//  Created by Alexandre DUARTE on 28/03/2024.
//

import SwiftUI

struct NoteCard: View {
    let note: Note
    
    var body: some View {
        VStack(spacing: 16.0, content: {
            Text(note.title)
                .frame(maxWidth: .infinity, alignment: .leading)
            Text(note.content)
                .lineLimit(4)
                .truncationMode(.tail)
                .frame(maxWidth: .infinity, alignment: .leading)
            Spacer()
        })
        .padding(16.0)
        .background(note.category?.color)
        .clipShape(
            RoundedRectangle(cornerRadius: 16.0)
        )
        .shadow(color: note.category?.color ?? Color.black, radius: 4)
    }
}

#Preview {
    NoteCard(
        note: .init(
            title: "Test",
            content: "dfjdfjdfkjkdfjkfddfjkjdkfjdkdjk",
            category: .health)
    )
}
