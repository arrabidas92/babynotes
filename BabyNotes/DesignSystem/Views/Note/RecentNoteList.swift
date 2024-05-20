//
//  RecentNoteList.swift
//  BabyNotes
//
//  Created by Alexandre DUARTE on 30/03/2024.
//

import SwiftUI
import SwiftData

struct RecentNoteList: View {
    let width: Double
    let hasAddedRecentNote: Bool
    let onTap: (Note) -> ()
    let onDelete: (Category?) -> ()
    
    static private var descriptor: FetchDescriptor<Note> {
        var descriptor = FetchDescriptor<Note>(sortBy: [SortDescriptor(\.updatedAt, order: .reverse)])
        descriptor.fetchLimit = 5
        return descriptor
    }
    
    @Query(descriptor) private var data: [Note]
    @Environment(\.modelContext) private var context
    
    var body: some View {
        ScrollViewReader { value in
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 16.0) {
                    ForEach(data.indices, id: \.self) { idx in
                        let note = data[idx]
                        NoteCard(
                            note: note,
                            onTap: { onTap($0) },
                            onDelete: {
                                context.delete($0)
                                let category = Category(rawValue: $0.idCategory)
                                onDelete(category)
                            }
                        )
                        .frame(width: width)
                        .id(note.id)
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
            .onAppear {
                scrollToLatestNote(value)
            }
        }
    }
    
    private func scrollToLatestNote(_ value: ScrollViewProxy) {
        guard hasAddedRecentNote else { return }
        value.scrollTo(0, anchor: .trailing)
    }
}
