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
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $router.navPath) {
                HomeNote(router: router)
                    .navigationDestination(for: Route.self) { navigate(to: $0) }
            }
            .tint(Color.black)
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
            ListNote()
        }
    }
}
