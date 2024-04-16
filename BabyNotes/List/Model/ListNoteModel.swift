//
//  ListNoteModel.swift
//  BabyNotes
//
//  Created by Alexandre DUARTE on 09/04/2024.
//

import SwiftUI
import SwiftData

extension ListNote {
    @Observable class Model {
        var notes: [Note] = []
        
        @ObservationIgnored private var totalNotes = 0
        @ObservationIgnored private var offset = 0
        
        func fetchMoreNotes(context: ModelContext, note: Note) {
            let thresholdIndex = notes.index(notes.endIndex, offsetBy: -1)
            let currentNote = notes[thresholdIndex].id
            if currentNote == note.id, (offset + 1) <= totalNotes {
                offset += 5
                fetchNotes(context: context)
            }
        }
        
        func fetchNotes(context: ModelContext) {
            var descriptor = FetchDescriptor<Note>(sortBy: [SortDescriptor(\.updatedAt, order: .reverse)])
            descriptor.fetchOffset = offset
            descriptor.fetchLimit = 5
            let notes = try? context.fetch(descriptor)
            self.notes.append(contentsOf: notes ?? [])
        }
        
        func fetchNumberOfNotes(context: ModelContext) {
            let descriptor = FetchDescriptor<Note>()
            let numberOfNotes = try? context.fetchCount(descriptor)
            totalNotes = numberOfNotes ?? 0
        }
    }
}
