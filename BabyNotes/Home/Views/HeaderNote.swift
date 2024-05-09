//
//  HeaderView.swift
//  BabyNotes
//
//  Created by Alexandre DUARTE on 04/03/2024.
//

import SwiftUI

struct HeaderNote: View {
    @Binding var search: String
    
    var body: some View {
        HeaderSearch(search: $search)
            .padding(
                EdgeInsets(
                    top: 0,
                    leading: 32,
                    bottom: 16,
                    trailing: 32
                )
            )
            .background(
                Color.white.shadow(
                    color: Color.black.opacity(0.04),
                    radius: 10, 
                    x: 0,
                    y: 15
                )
            )
    }
}

#Preview {
    HeaderNote(search: .constant(""))
}
