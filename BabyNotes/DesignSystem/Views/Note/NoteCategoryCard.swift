//
//  NoteCategoryCard.swift
//  BabyNotes
//
//  Created by Alexandre DUARTE on 01/04/2024.
//

import SwiftUI
import SwiftData

struct NoteCategoryCard: View {
    @Environment(\.modelContext) private var context
    
    let category: Category
    
    private var numberOfNotes: String {
        let descriptor = FetchDescriptor<Note>(predicate: #Predicate { $0.idCategory == category.rawValue })
        let numberOfNotes = try? context.fetchCount(descriptor)
        let rawValue = numberOfNotes ?? 0
        return rawValue > 1 ? "\(rawValue) Notes" : "\(rawValue) Note"
    }
    
    var body: some View {
        #if DEBUG
        Self._logChanges()
        #endif
        return HStack(spacing: 16.0) {
            NoteCategoryEmoji(emoji: category.emoji)
            VStack(alignment: .leading) {
                Text(numberOfNotes)
                    .font(.footnote)
                Text(category.title)
                    .font(.callout)
                    .bold()
            }
            Spacer()
        }
        .padding(16.0)
        .background(category.colorName.color)
        .clipShape(
            RoundedRectangle(cornerRadius: 16.0)
        )
        .shadow(color: category.colorName.color, radius: 4)
    }
}

#Preview {
    NoteCategoryCard(category: .health)
}
