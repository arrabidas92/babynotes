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
            CustomSearchNote(search: $search)
        })
        .padding(32.0)
    }
}

#Preview {
    HeaderNote()
}
