//
//  AddNote.swift
//  BabyNotes
//
//  Created by Alexandre DUARTE on 13/03/2024.
//

import SwiftUI

struct AddNote: View {
    @State private var selectedColor = "yellow"
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(selectedColor).ignoresSafeArea()
            }
        }
        .navigationTitle("Add a note")
        .toolbar {
            ToolbarItem(placement: ToolbarItemPlacement.navigationBarTrailing) {
                Picker("Colors", selection: $selectedColor) {
                    ForEach(["Yellow", "Green", "Red"], id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.automatic)
            }
        }
    }
}

#Preview {
    AddNote()
}
