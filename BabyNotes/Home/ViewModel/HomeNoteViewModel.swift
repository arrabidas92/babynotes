//
//  HomeNoteViewModel.swift
//  BabyNotes
//
//  Created by Alexandre DUARTE on 30/03/2024.
//

import SwiftUI
import SwiftData

extension HomeNote {
    @Observable class ViewModel {
        var modelContext: ModelContext
        var recentNote: [Note] = []
        var hasAddedRecentNote: Bool = false
        
        init(modelContext: ModelContext) {
            self.modelContext = modelContext
            fetchRecentNotes()
        }
        
        func fetchRecentNotes() {
            guard recentNote.isEmpty || hasAddedRecentNote else { return }
            print("HomeNoteVM::fetchRecentNotes")
            do {
                var descriptor = FetchDescriptor<Note>(sortBy: [SortDescriptor(\.updatedAt, order: .reverse)])
                descriptor.fetchLimit = 5
                recentNote = try modelContext.fetch(descriptor)
            } catch {
                print("Fetch failed")
                //TODO: Implement better error management
            }
        }
    }
}
