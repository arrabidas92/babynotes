//
//  Note.swift
//  BabyNotes
//
//  Created by Alexandre DUARTE on 25/03/2024.
//

import Foundation
import SwiftData

@Model class Note: Hashable {
    @Attribute(.unique) var id: UUID
    var title: String
    var content: String
    var category: Category?
    var updatedAt: TimeInterval
    
    init(title: String, content: String, category: Category?) {
        self.id = UUID()
        self.title = title
        self.content = content
        self.category = category
        self.updatedAt = Date().timeIntervalSince1970
    }
    
    var description: String {
        return "Note id = \(id), title = \(title), content = \(content), category = \(String(describing: category)), updatedAt = \(updatedAt)"
    }
}
