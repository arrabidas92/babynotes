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
    @Binding var deletedCategory: Category?
    
    @Environment(\.modelContext) private var context
    @State private var nbNotes = 0
    
    var body: some View {
        return HStack(spacing: 16.0) {
            NoteCategoryEmoji(emoji: category.emoji)
            VStack(alignment: .leading) {
                Text(nbNotesFormatted)
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
    
    var nbNotesFormatted: String {
        let _nbNotes: Int
        
        if deletedCategory == category {
            _nbNotes = nbNotes - 1
        } else {
            _nbNotes = nbNotes
        }
        
        return _nbNotes > 1 ? "\(_nbNotes) Notes" : "\(_nbNotes) Note"
    }
    
    private func updateNumberOfNotes() {
        let descriptor = FetchDescriptor<Note>(predicate: #Predicate { $0.idCategory == category.rawValue })
        let numberOfNotes = try? context.fetchCount(descriptor)
        nbNotes = numberOfNotes ?? 0
    }
}

#Preview {
    NoteCategoryCard(
        category: .health,
        deletedCategory: .constant(nil)
    )
}
