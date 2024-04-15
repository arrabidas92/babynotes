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
        
        func fetchNotes(from context: ModelContext) {
            let descriptor = FetchDescriptor<Note>(sortBy: [SortDescriptor(\.updatedAt, order: .reverse)])
            let notes = try? context.fetch(descriptor)
            self.notes = notes ?? []
        }
    }
}
