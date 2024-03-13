//
//  HeaderView.swift
//  BabyNotes
//
//  Created by Alexandre DUARTE on 04/03/2024.
//

import SwiftUI

struct HeaderNote: View {
    @State private var search: String = ""
    
    var body: some View {
        VStack(alignment: .leading, content: {
            HeaderInfos()
            Spacer()
                .frame(height: 32.0)
            HeaderSearch(search: $search)
        })
        .padding(32.0)
        .background(Color.white.shadow(color: Color.black.opacity(0.04), radius: 10, x: 0, y: 15))
    }
}

#Preview {
    HeaderNote()
}
