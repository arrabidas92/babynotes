//
//  Note.swift
//  BabyNotes
//
//  Created by Alexandre DUARTE on 25/03/2024.
//

import Foundation
import SwiftData

@Model class Note {
    @Attribute(.unique) var id: UUID
    var title: String
    var content: String
    var category: Category?
    
    init(title: String, content: String, category: Category?) {
        self.id = UUID()
        self.title = title
        self.content = content
        self.category = category
    }
    
    var description: String {
        return "Note id = \(id), title = \(title), content = \(content), category = \(String(describing: category))"
    }
}
