//
//  ListNote.swift
//  BabyNotes
//
//  Created by Alexandre DUARTE on 09/04/2024.
//

import SwiftUI
import SwiftData

struct ListNote: View {
    let onTap: (Note) -> ()
    
    @Query private var notes: [Note]
    @Environment(\.modelContext) private var context
    
    init(
        mode: ListMode,
        onTap: @escaping (Note) -> ()
    ) {
        self.onTap = onTap
        
        let descriptor: FetchDescriptor<Note>
        
        switch mode {
        case .category(let category):
            descriptor = FetchDescriptor<Note>(
                predicate: #Predicate { $0.idCategory == category.rawValue },
                sortBy: [
                    SortDescriptor(\.updatedAt, order: .reverse)
                ]
            )
        case .search(let string):
            descriptor = FetchDescriptor<Note>(
                predicate: #Predicate {
                    $0.title.localizedStandardContains(string) ||
                    $0.content.localizedStandardContains(string) ||
                    $0.categoryTitle.localizedStandardContains(string)
                },
                sortBy: [
                    SortDescriptor(\.updatedAt, order: .reverse)
                ]
            )
        }
        
        _notes = Query(descriptor)
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack(spacing: 16.0) {
                ForEach(notes.indices, id: \.self) { idx in
                    let note = notes[idx]
                    NoteCard(
                        note: note,
                        onTap: { onTap($0) },
                        onDelete: { context.delete($0) }
                    )
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
        .navigationTitle("Liste")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ListNote(mode: .category(.health)) { note in print(note) }
}
