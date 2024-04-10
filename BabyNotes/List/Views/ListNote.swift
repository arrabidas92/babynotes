//
//  ListNote.swift
//  BabyNotes
//
//  Created by Alexandre DUARTE on 09/04/2024.
//

import SwiftUI
//TODO:Continue try adding pagination
struct ListNote: View {
    @State private var vm = ViewModel()
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 16.0) {
                ForEach(vm.notes.indices, id: \.self) { idx in
                    NoteCard(note: vm.notes[idx])
                        .frame(maxWidth: .infinity)
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
        .onAppear { vm.fetchNotes() }
    }
}

#Preview {
    ListNote()
}
