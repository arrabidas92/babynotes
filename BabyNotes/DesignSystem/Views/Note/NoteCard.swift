//
//  NoteCard.swift
//  BabyNotes
//
//  Created by Alexandre DUARTE on 28/03/2024.
//

import SwiftUI

struct NoteCard: View {
    let note: Note
    let onTap: (Note) -> ()
    let onDelete: (Note) -> ()
    
    var body: some View {
        let _ = Self._printChanges()
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
        .background(note.categoryColor.color)
        .clipShape(
            RoundedRectangle(cornerRadius: 16.0)
        )
        .shadow(color: note.categoryColor.color, radius: 4)
        .onTapGesture { onTap(note) }
        .contextMenu(
            ContextMenu(
                menuItems: {
                    Button(
                        role: .destructive,
                        action: { onDelete(note) },
                        label: {
                        Label("Supprimer", systemImage: "trash")
                    })
                }
            )
        )
    }
}
