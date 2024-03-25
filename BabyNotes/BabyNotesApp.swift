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
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                HomeNote()
            }
            .tint(Color.black)
        }
        .modelContainer(for: [Note.self])
    }
}
