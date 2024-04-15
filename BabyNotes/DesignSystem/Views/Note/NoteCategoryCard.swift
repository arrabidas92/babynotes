//
//  NoteCategoryCard.swift
//  BabyNotes
//
//  Created by Alexandre DUARTE on 01/04/2024.
//

import SwiftUI

struct NoteCategoryCard: View {
    let category: Category
    @Binding var hasAddedRecentNote: Bool
    @Environment(\.modelContext) private var context
    @State private var model = Model()
    
    var body: some View {
        HStack(spacing: 16.0) {
            NoteCategoryEmoji(emoji: category.emoji)
            VStack(alignment: .leading) {
                Text("\(model.numberOfNotes) \(model.numberOfNotesText)")
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
        .onFirstAppear {
            model.fetchNumberOfNotes(context: context, idCategory: category.rawValue, hasAddedRecentNote: true)
        }
        .onAppear { model.fetchNumberOfNotes(context: context, idCategory: category.rawValue, hasAddedRecentNote: hasAddedRecentNote)}
    }
}

#Preview {
    NoteCategoryCard(category: .health, hasAddedRecentNote: .constant(false))
}
