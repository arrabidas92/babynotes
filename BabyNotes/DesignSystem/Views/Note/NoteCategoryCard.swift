//
//  NoteCategoryCard.swift
//  BabyNotes
//
//  Created by Alexandre DUARTE on 01/04/2024.
//

import SwiftUI

struct NoteCategoryCard: View {
    let category: Category
    @State private var vm = ViewModel()
    @Binding var hasAddedRecentNote: Bool
    
    var body: some View {
        HStack(spacing: 16.0) {
            NoteCategoryEmoji(emoji: category.emoji)
            VStack(alignment: .leading) {
                Text("\(vm.numberOfNotes) \(vm.numberOfNotesText)")
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
            vm.fetchNumberOfNotes(idCategory: category.rawValue, hasAddedRecentNote: true)
        }
        .onAppear { vm.fetchNumberOfNotes(idCategory: category.rawValue, hasAddedRecentNote: hasAddedRecentNote)}
    }
}

#Preview {
    NoteCategoryCard(category: .health, hasAddedRecentNote: .constant(false))
}
