//
//  HomeNoteViewModel.swift
//  BabyNotes
//
//  Created by Alexandre DUARTE on 30/03/2024.
//

import SwiftUI

extension HomeNote {
    @Observable class ViewModel {
        var recentNote: [Note] = []
        var hasAddedRecentNote: Bool = false
        
        @ObservationIgnored
        private let repository: NoteRepository
        
        init(repository: NoteRepository = NoteRepositoryImpl.shared) {
            self.repository = repository
        }
        
        func fetchRecentNotes() {
            guard recentNote.isEmpty || hasAddedRecentNote else { return }
            
            recentNote = repository.fetchNotes(limit: 5)
        }
    }
}
