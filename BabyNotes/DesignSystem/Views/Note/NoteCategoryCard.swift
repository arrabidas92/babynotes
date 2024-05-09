//
//  NoteCategoryCard.swift
//  BabyNotes
//
//  Created by Alexandre DUARTE on 01/04/2024.
//

import SwiftUI
import SwiftData

struct NoteCategoryCard: View {
    let category: Category
    
    @Environment(\.modelContext) private var context
    @State private var _numberOfNotes: String = "0 Note"
    
    var body: some View {
        return HStack(spacing: 16.0) {
            NoteCategoryEmoji(emoji: category.emoji)
            VStack(alignment: .leading) {
                Text(_numberOfNotes)
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
        .onAppear { updateNumberOfNotes() }
    }
    
    private func updateNumberOfNotes() {
        let descriptor = FetchDescriptor<Note>(predicate: #Predicate { $0.idCategory == category.rawValue })
        let numberOfNotes = try? context.fetchCount(descriptor)
        let rawValue = numberOfNotes ?? 0
        _numberOfNotes = rawValue > 1 ? "\(rawValue) Notes" : "\(rawValue) Note"
    }
}

#Preview {
    NoteCategoryCard(category: .health)
}
