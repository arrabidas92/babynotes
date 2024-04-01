//
//  NoteCategoryCard.swift
//  BabyNotes
//
//  Created by Alexandre DUARTE on 01/04/2024.
//

import SwiftUI

struct NoteCategoryCard: View {
    let category: Category
    
    var body: some View {
        HStack(spacing: 16.0) {
            NoteCategoryEmoji(emoji: category.emoji)
            VStack {
                Text(category.title)
                    .font(.callout)
                    .bold()
            }
            Spacer()
        }
        .padding(16.0)
        .background(category.color)
        .clipShape(
            RoundedRectangle(cornerRadius: 16.0)
        )
        .shadow(color: category.color, radius: 4)
    }
}

#Preview {
    NoteCategoryCard(category: .health)
}
