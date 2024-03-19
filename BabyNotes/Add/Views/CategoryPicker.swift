//
//  CategoryPicker.swift
//  BabyNotes
//
//  Created by Alexandre DUARTE on 19/03/2024.
//

import SwiftUI

struct CategoryPicker: View {
    @Binding var selectedCategory: Category
    
    var body: some View {
        Picker("Category", selection: $selectedCategory) {
            ForEach(Category.allCases, id: \.self) { category in
                Text(category.title)
            }
        }
        .pickerStyle(.automatic)
    }
}
