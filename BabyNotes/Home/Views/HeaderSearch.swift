//
//  CustomSearchNote.swift
//  BabyNotes
//
//  Created by Alexandre DUARTE on 04/03/2024.
//

import SwiftUI

struct HeaderSearch: View {
    @Binding var search: String
    
    var body: some View {
        HStack {
            TextField(
                "",
                text: $search,
                prompt:
                    Text("Search a note")
                    .foregroundStyle(Color.white)
            )
            .foregroundStyle(Color.white)
            .padding(16.0)
            Image(systemName: "magnifyingglass")
                .padding(.trailing, 16.0)
                .foregroundStyle(Color.white)
        }
        .background(Color.black)
        .clipShape(
            RoundedRectangle(cornerRadius: 8.0)
        )
        
    }
}

#Preview {
    HeaderSearch(search: .constant(""))
}
