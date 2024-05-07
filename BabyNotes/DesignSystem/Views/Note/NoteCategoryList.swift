//
//  NoteCategoryList.swift
//  BabyNotes
//
//  Created by Alexandre DUARTE on 03/04/2024.
//

import SwiftUI

struct NoteCategoryList: View {
    let action: (Category) -> ()
    
    var body: some View {
        ForEach(Category.allCases, id: \.self) { category in
            NoteCategoryCard(category: category)
                .padding(
                    EdgeInsets(
                        top: 8,
                        leading: 32,
                        bottom: 8,
                        trailing: 32
                    )
                )
                .onTapGesture { action(category) }
        }
    }
}

#Preview {
    NoteCategoryList { category in print(category) }
}
