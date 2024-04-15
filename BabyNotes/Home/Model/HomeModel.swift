//
//  HomeModel.swift
//  BabyNotes
//
//  Created by Alexandre DUARTE on 15/04/2024.
//

import SwiftUI
import SwiftData

extension HomeNote {
    @Observable class Model {
        var recentNote: [Note] = []
        
        func fetchRecentNotes(from context: ModelContext, hasAddedRecentNote: Bool) {
            guard recentNote.isEmpty || hasAddedRecentNote else { return }
            
            var descriptor = FetchDescriptor<Note>(sortBy: [SortDescriptor(\.updatedAt, order: .reverse)])
            descriptor.fetchLimit = 5
            
            let notes = try? context.fetch(descriptor)
            recentNote = notes ?? []
        }
    }
}
