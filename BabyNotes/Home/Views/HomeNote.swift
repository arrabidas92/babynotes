//
//  ContentView.swift
//  BabyNotes
//
//  Created by Alexandre DUARTE on 04/03/2024.
//

import OSLog
import SwiftUI
import SwiftData

struct HomeNote: View {
    @Environment(\.modelContext) private var context
    @Environment(RouterImpl.self) private var router
    @Binding var hasAddedRecentNote: Bool
    @State private var search: String = ""
    @State private var deletedCategory: Category? = nil
    
    var body: some View {
        VStack(spacing: 0) {
            HeaderNote(search: $search)
            GeometryReader { geometry in
                ZStack(alignment: .bottomTrailing, content: {
                    ScrollView {
                        if search.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                            Spacer(minLength: 16.0)
                            HeaderSection(
                                title: "Recent",
                                style: .none,
                                action: nil
                            )
                            RecentNoteList(
                                width: geometry.size.width / 2,
                                hasAddedRecentNote: hasAddedRecentNote,
                                onTap: { note in
                                    router.navigate(to: .editNote(note))
                                },
                                onDelete: { deletedCategory in
                                    self.deletedCategory = deletedCategory
                                }
                            )
                            HeaderSection(
                                title: "Category",
                                style: .none,
                                action: nil
                            )
                            NoteCategoryList(
                                action: {
                                router.navigate(to: .noteCategory($0))
                            }, deletedCategory: $deletedCategory
                            )
                        } else {
                            ListNote(mode: .search(search)) { router.navigate(to: .editNote($0))
                            }
                        }
                    }
                    .safeAreaPadding(.bottom, 66)
                    .scrollIndicators(.hidden)
                    
                    SystemIconButton(
                        systemImageName: "pencil.and.scribble",
                        width: 50,
                        tint: .white,
                        background: Color.black,
                        action: {
                            router.navigate(to: .addNote)
                        }
                    )
                    .padding(.trailing, 32)
                })
            }
        }
        .onDisappear {
            hasAddedRecentNote = false
            deletedCategory = nil
        }
        .navigationTitle("Accueil")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    HomeNote(hasAddedRecentNote: .constant(false))
}
