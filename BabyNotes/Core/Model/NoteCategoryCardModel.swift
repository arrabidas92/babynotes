//
//  NoteCategoryCardModel.swift
//  BabyNotes
//
//  Created by Alexandre DUARTE on 08/04/2024.
//

import SwiftUI
import SwiftData

extension NoteCategoryCard {
    @Observable class Model {
        var numberOfNotes: Int = 0
        
        var numberOfNotesText: String {
            return numberOfNotes > 1 ? "Notes" : "Note"
        }
        
        func fetchNumberOfNotes(context: ModelContext, idCategory: String, hasAddedRecentNote: Bool) {
            guard hasAddedRecentNote else { return }
            
            let descriptor = FetchDescriptor<Note>(predicate: #Predicate { $0.idCategory == idCategory })
            let numberOfNotes = try? context.fetchCount(descriptor)
            self.numberOfNotes = numberOfNotes ?? 0
        }
    }
}
