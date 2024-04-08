//
//  CategoryCard.swift
//  BabyNotes
//
//  Created by Alexandre DUARTE on 01/04/2024.
//

import SwiftUI

struct NoteCategoryEmoji: View {
    let emoji: String
    
    var body: some View {
        ZStack(content: {
            Text(emoji)
                .font(.title)
                .padding(8.0)
                .background(.white)
                .clipShape(Circle())
        })
    }
}

#Preview {
    NoteCategoryEmoji(emoji: "❤️")
}
