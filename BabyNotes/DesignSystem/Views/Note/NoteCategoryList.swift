//
//  NoteCategoryList.swift
//  BabyNotes
//
//  Created by Alexandre DUARTE on 03/04/2024.
//

import SwiftUI

struct NoteCategoryList: View {
    @Binding var hasAddedRecentNote: Bool
    
    var body: some View {
        ForEach(Category.allCases, id: \.self) { category in
            NoteCategoryCard(category: category, hasAddedRecentNote: $hasAddedRecentNote)
                .padding(
                    EdgeInsets(
                        top: 8,
                        leading: 32,
                        bottom: 8,
                        trailing: 32
                    )
                )
        }
    }
}

#Preview {
    NoteCategoryList(hasAddedRecentNote: .constant(false))
}
