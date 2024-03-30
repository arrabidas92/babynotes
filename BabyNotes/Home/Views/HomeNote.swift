//
//  ContentView.swift
//  BabyNotes
//
//  Created by Alexandre DUARTE on 04/03/2024.
//

import SwiftUI
import SwiftData

struct HomeNote: View {
    @State private var vm: ViewModel
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .bottomTrailing, content: {
                ScrollView {
                    HeaderNote()
                    HeaderSection(style: .text)
                        .padding(
                            EdgeInsets(
                                top: 16,
                                leading: 32,
                                bottom: 8,
                                trailing: 32
                            )
                        )
                    //TODO: Fix scroll view position when adding new note should scroll to the first one
                    RecentNoteList(width: geometry.size.width / 2, data: $vm.recent, scrollPosition: .constant(3))
                }
                NavigationLink(
                    destination: AddNote()
                ) {
                    SystemIconButton(
                        systemImageName: "pencil.and.scribble",
                        width: 50,
                        tint: .white,
                        background: Color.black
                    )
                    .padding(.trailing, 32)
                }
                .navigationTitle("Accueil")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar(.hidden)
            })
        }
        .onAppear { vm.fetchRecentNotes() }
    }
    
    init(modelContext: ModelContext) {
        vm = ViewModel(modelContext: modelContext)
    }
}

#Preview {
    let container = try! ModelContainer(for: Note.self)
    return HomeNote(modelContext: container.mainContext)
}
