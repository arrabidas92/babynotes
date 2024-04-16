//
//  ListNote.swift
//  BabyNotes
//
//  Created by Alexandre DUARTE on 09/04/2024.
//

import SwiftUI
import OSLog

struct ListNote: View {
    @Environment(\.modelContext) private var context
    @State private var model = Model()
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack(spacing: 16.0) {
                ForEach(model.notes.indices, id: \.self) { idx in
                    let note = model.notes[idx]
                    NoteCard(note: note)
                        .frame(maxWidth: .infinity)
                        .id(idx)
                        .onAppear {
                            model.fetchMoreNotes(
                                context: context,
                                note: note
                            )
                        }
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
        .onFirstAppear {
            Logger.viewCycle.notice("listNote::onFirstAppear")
            model.fetchNumberOfNotes(context: context)
            model.fetchNotes(context: context)
        }
    }
}

#Preview {
    ListNote()
}
