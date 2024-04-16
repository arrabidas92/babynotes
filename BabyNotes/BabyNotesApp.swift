//
//  BabyNotesApp.swift
//  BabyNotes
//
//  Created by Alexandre DUARTE on 04/03/2024.
//

import SwiftUI

@main
struct BabyNotesApp: App {
    @State private var model = Model()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $model.router.navPath) {
                HomeNote(
                    router: model.router,
                    hasAddedRecentNote: $model.hasAddedRecentNote
                )
                .navigationDestination(for: Route.self) { navigate(to: $0) }
            }
            .tint(Color.black)
            .modelContainer(for: Note.self)
        }
    }
    
    @ViewBuilder
    private func navigate(to route: Route) -> some View {
        switch route {
        case .seeAllNotes:
            ListNote()
        case .editNote:
            ListNote()
        case .noteCategory:
            ListNote()
        case .addNote:
            AddNote(hasAddedRecentNote: $model.hasAddedRecentNote)
        }
    }
}
