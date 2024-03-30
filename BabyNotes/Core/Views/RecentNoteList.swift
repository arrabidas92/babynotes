//
//  RecentNoteList.swift
//  BabyNotes
//
//  Created by Alexandre DUARTE on 30/03/2024.
//

import SwiftUI

struct RecentNoteList: View {
    let width: Double
    @Binding var data: [Note]
    @Binding var scrollPosition: Int?
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16.0) {
                ForEach(data, id: \.id) { note in
                    NoteCard(note: note)
                        .frame(width: width)
                }
            }
            .padding(
                EdgeInsets(
                    top: 8,
                    leading: 32,
                    bottom: 8,
                    trailing: 32
                )
            )
            .scrollTargetLayout()
        }
        .scrollPosition(id: $scrollPosition)
    }
}

#Preview {
    RecentNoteList(
        width: 100,
        data: .constant([
            .init(title: "1", content: "kfjddjfdjkjfd", category: .health),
            .init(title: "2", content: "skklsdkldsklds", category: .awakening)
        ]), scrollPosition: .constant(0)
    )
}
