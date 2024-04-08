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
    @Binding var hasAddedRecentNote: Bool
    
    var body: some View {
        ScrollViewReader { value in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16.0) {
                    ForEach(data.indices, id: \.self) { idx in
                        NoteCard(note: data[idx])
                            .frame(width: width)
                            .id(idx)
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
            }
            .onAppear { scrollToLatestNote(value) }
        }
    }
    
    private func scrollToLatestNote(_ value: ScrollViewProxy) {
        guard hasAddedRecentNote else { return }
        value.scrollTo(0, anchor: .trailing)
    }
}

#Preview {
    RecentNoteList(
        width: 100,
        data: .constant([
            .init(title: "1", content: "kfjddjfdjkjfd", category: .health),
            .init(title: "2", content: "skklsdkldsklds", category: .awakening)
        ]), hasAddedRecentNote: .constant(false)
    )
}
