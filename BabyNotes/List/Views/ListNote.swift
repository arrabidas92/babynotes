//
//  ListNote.swift
//  BabyNotes
//
//  Created by Alexandre DUARTE on 09/04/2024.
//

import SwiftUI
import SwiftData

struct ListNote: View {
    @Query private var notes: [Note]
    
    init(category: Category) {
        let descriptor = FetchDescriptor<Note>(
            predicate: #Predicate { $0.idCategory == category.rawValue },
            sortBy: [
                SortDescriptor(\.updatedAt, order: .reverse)
            ]
        )
        
        _notes = Query(descriptor)
    }
    
    var body: some View {
        let _ = Self._printChanges()
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack(spacing: 16.0) {
                ForEach(notes.indices, id: \.self) { idx in
                    let note = notes[idx]
                    NoteCard(note: note)
                        .frame(maxWidth: .infinity)
                        .id(idx)
                }
            }
            .padding(
                EdgeInsets(
                    top: 8,
                    leading: 32,
                    bottom: 8,
                    trailing: 32
                )
            )
        }
    }
}

#Preview {
    ListNote(category: .health)
}
