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
        var recent: [Note] = []
        var recentScrollPosition: Int = 0
        
        init(modelContext: ModelContext) {
            self.modelContext = modelContext
            fetchRecentNotes()
        }
        
        func fetchRecentNotes() {
            do {
                var descriptor = FetchDescriptor<Note>(sortBy: [SortDescriptor(\.updatedAt, order: .reverse)])
                descriptor.fetchLimit = 5
                recent = try modelContext.fetch(descriptor)
            } catch {
                print("Fetch failed")
                //TODO: Implement better error management
            }
        }
    }
}
