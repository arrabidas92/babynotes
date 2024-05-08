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
    var idCategory: String
    var categoryTitle: String
    var categoryColor: String
    var categoryEmoji: String
    var updatedAt: TimeInterval
    
    init(title: String, content: String, category: Category) {
        self.id = UUID()
        self.title = title
        self.content = content
        self.idCategory = category.rawValue
        self.categoryTitle = category.title
        self.categoryColor = category.colorName
        self.categoryEmoji = category.emoji
        self.updatedAt = Date().timeIntervalSince1970
    }
    
    func update(title: String, content: String, category: Category) {
        self.title = title
        self.content = content
        self.idCategory = category.rawValue
        self.categoryTitle = category.title
        self.categoryColor = category.colorName
        self.categoryEmoji = category.emoji
    }
    
    var description: String {
        return "Note id = \(id), title = \(title), content = \(content), idCategory = \(idCategory), idCategory = \(categoryTitle), categoryColor = \(categoryColor), categoryEmoji = \(categoryEmoji), updatedAt = \(updatedAt)"
    }
}
