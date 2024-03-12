//
//  CustomSearchNote.swift
//  BabyNotes
//
//  Created by Alexandre DUARTE on 04/03/2024.
//

import SwiftUI

struct CustomSearchNote: View {
    @Binding var search: String
    
    var body: some View {
        HStack {
            TextField(
                "",
                text: $search,
                prompt:
                    Text("Rechercher une note")
                    .foregroundStyle(Color.black)
            )
            .foregroundStyle(Color.black)
            .padding(16.0)
            Image(systemName: "magnifyingglass")
                .padding(.trailing, 16.0)
        }
        .background(
            Color.Resolved(red: 255/255, green: 228/255, blue: 176/255)
        )
        .clipShape(
            RoundedRectangle(cornerRadius: 8.0)
        )
        
    }
}

#Preview {
    CustomSearchNote(search: .constant(""))
}
