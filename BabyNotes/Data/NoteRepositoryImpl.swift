//
//  NoteRepositoryImpl.swift
//  BabyNotes
//
//  Created by Alexandre DUARTE on 08/04/2024.
//

import SwiftUI
import SwiftData

final class NoteRepositoryImpl: NoteRepository {
    private let context: ModelContext

    @MainActor
    static let shared = NoteRepositoryImpl()

    @MainActor
    private init() {
        let container = try! ModelContainer(for: Note.self)
        self.context = container.mainContext
    }

    func fetchNotes(limit: Int) -> [Note] {
        var descriptor = FetchDescriptor<Note>(sortBy: [SortDescriptor(\.updatedAt, order: .reverse)])
        descriptor.fetchLimit = limit
        guard let notes = try? context.fetch(descriptor) else {
            return []
        }
        
        return notes
    }
    
    func addNote(_ note: Note) {
        context.insert(note)
    }
    
    func fetchNumberOfNotes(idCategory: String) -> Int {
        let descriptor = FetchDescriptor<Note>(predicate: #Predicate { $0.idCategory == idCategory })
        let numberOfNotes = try? context.fetchCount(descriptor)
        return numberOfNotes ?? 0
    }
}
