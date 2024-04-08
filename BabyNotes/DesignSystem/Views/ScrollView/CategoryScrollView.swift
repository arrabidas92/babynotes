//
//  CategoryScrollView.swift
//  BabyNotes
//
//  Created by Alexandre DUARTE on 21/03/2024.
//

import SwiftUI

struct CategoryScrollView: View {
    @Binding var selectedCategory: Category?
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8.0) {
                ForEach(Category.allCases, id: \.self) { category in
                    Text(category.title)
                        .onTapGesture {
                            if category == selectedCategory {
                                selectedCategory = nil
                            } else {
                                selectedCategory = category
                            }
                        }
                        .foregroundStyle(.black)
                        .font(.callout)
                        .padding()
                        .background(
                            Capsule()
                                .strokeBorder(
                                    Color.black,
                                    lineWidth: 0.8
                                )
                                .background(category.colorName.color)
                        )
                        .clipShape(Capsule())
                        .opacity(
                            getOpacityLevel(for: category)
                        )
                }
            }
            .padding(.horizontal, 20.0)
        }
        .onDisappear { selectedCategory = nil }
    }
    
    private func getOpacityLevel(for category: Category) -> CGFloat {
        return category == selectedCategory ? 1.0 : 0.5
    }
}

#Preview {
    CategoryScrollView(selectedCategory: .constant(.food))
}
