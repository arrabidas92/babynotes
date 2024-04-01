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
                    HeaderSection(title: "Recent", style: .text)
                    RecentNoteList(
                        width: geometry.size.width / 2,
                        data: $vm.recentNote,
                        hasAddedRecentNote: $vm.hasAddedRecentNote
                    )
                    HeaderSection(title: "Category", style: .none)
                    //TODO: Fetch all categories and displayed them
                    NoteCategoryCard(category: .health)
                        .padding(
                            EdgeInsets(
                                top: 8,
                                leading: 32,
                                bottom: 8,
                                trailing: 32
                            )
                        )
                }
                NavigationLink(
                    destination: AddNote(hasAddedRecentNote: $vm.hasAddedRecentNote)
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
        .onDisappear { vm.hasAddedRecentNote = false }
    }
    
    init(modelContext: ModelContext) {
        vm = ViewModel(modelContext: modelContext)
    }
}

#Preview {
    let container = try! ModelContainer(for: Note.self)
    return HomeNote(modelContext: container.mainContext)
}
