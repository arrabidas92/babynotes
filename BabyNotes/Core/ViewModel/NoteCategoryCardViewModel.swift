//
//  NoteCategoryCardViewModel.swift
//  BabyNotes
//
//  Created by Alexandre DUARTE on 08/04/2024.
//

import SwiftUI

extension NoteCategoryCard {
    @Observable class ViewModel {
        var numberOfNotes: Int = 0
        
        @ObservationIgnored
        private let repository: NoteRepository
        
        init(repository: NoteRepository = NoteRepositoryImpl.shared) {
            self.repository = repository
        }
        
        var numberOfNotesText: String {
            return numberOfNotes > 1 ? "Notes" : "Note"
        }
        
        func fetchNumberOfNotes(idCategory: String, hasAddedRecentNote: Bool) {
            guard hasAddedRecentNote else { return }
            print("fetchNumberOfNotes")
            numberOfNotes = repository.fetchNumberOfNotes(idCategory: idCategory)
        }
    }
}
