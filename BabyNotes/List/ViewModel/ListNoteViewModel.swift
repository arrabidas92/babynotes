//
//  ListNoteViewModel.swift
//  BabyNotes
//
//  Created by Alexandre DUARTE on 09/04/2024.
//

import SwiftUI

extension ListNote {
    @Observable class ViewModel {
        var notes: [Note] = []
        
        @ObservationIgnored
        private let repository: NoteRepository
        
        init(repository: NoteRepository = NoteRepositoryImpl.shared) {
            self.repository = repository
        }
        
        func fetchNotes() {
            notes = repository.fetchNotes(limit: 0)
        }
    }
}
