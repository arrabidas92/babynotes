//
//  ContentView.swift
//  BabyNotes
//
//  Created by Alexandre DUARTE on 04/03/2024.
//

import SwiftUI
import SwiftData

struct HomeNote: View {
    @Environment(\.modelContext) private var context
    
    var recentNotes: [Note] {
        var fetchDescriptor = FetchDescriptor<Note>(sortBy: [SortDescriptor(\.updatedAt, order: .reverse)])
        fetchDescriptor.fetchLimit = 5
        
        do {
            let notes = try context.fetch(fetchDescriptor)
            
            for note in notes {
                print("Found \(note.description)")
            }
            
            return notes
        } catch {
            print("Failed to load recent Notes.")
            return []
        }
    }
    
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
                    //Add list of swift data notes
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16.0) {
                            ForEach(recentNotes, id: \.id) { note in
                                
                                NoteCard(note: note)
                                    .frame(width: geometry.size.width / 2)
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
    }
}

#Preview {
    HomeNote()
}
