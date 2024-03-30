//
//  BabyNotesApp.swift
//  BabyNotes
//
//  Created by Alexandre DUARTE on 04/03/2024.
//

import SwiftUI
import SwiftData

@main
struct BabyNotesApp: App {
    let container: ModelContainer
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                HomeNote(modelContext: container.mainContext)
            }
            .tint(Color.black)
        }
        .modelContainer(container)
    }
                        
    init() {
        do {
            container = try ModelContainer(for: Note.self)
        } catch {
            fatalError("Failed to create ModelContainer for Movie.")
        }
    }
}
