//
//  BabyNotesApp.swift
//  BabyNotes
//
//  Created by Alexandre DUARTE on 04/03/2024.
//

import SwiftUI

@main
struct BabyNotesApp: App {
    @State private var router = RouterImpl()
    @State private var hasAddedRecentNote: Bool = false
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $router.navPath) {
                HomeNote(hasAddedRecentNote: $hasAddedRecentNote)
                    .navigationDestination(for: Route.self) { navigate(to: $0) }
                    .environment(router)
            }
            .tint(Color.black)
        }
        .modelContainer(for: Note.self)
    }
    
    @ViewBuilder
    private func navigate(to route: Route) -> some View {
        switch route {
        case .editNote:
            EmptyView()
        case .noteCategory(let category):
            ListNote(category: category)
        case .addNote:
            AddNote(hasAddedRecentNote: $hasAddedRecentNote)
        }
    }
}
