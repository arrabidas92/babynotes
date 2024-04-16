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
    @Bindable var router: RouterImpl
    @Binding var hasAddedRecentNote: Bool
    @Environment(\.modelContext) private var context
    @State private var model = Model()
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .bottomTrailing, content: {
                ScrollView {
                    HeaderNote()
                    HeaderSection(
                        title: "Recent",
                        style: .text
                    ) {
                        router.navigate(to: .seeAllNotes)
                    }
                    RecentNoteList(
                        width: geometry.size.width / 2,
                        data: $model.recentNote,
                        hasAddedRecentNote: $hasAddedRecentNote
                    )
                    HeaderSection(
                        title: "Category",
                        style: .none,
                        action: nil
                    )
                    NoteCategoryList(hasAddedRecentNote: $hasAddedRecentNote)
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
            .onAppear {
                Logger.viewCycle.notice("homeNote::onAppear")
                model.fetchRecentNotes(from: context, hasAddedRecentNote: hasAddedRecentNote)
            }
            .onDisappear {
                Logger.viewCycle.notice("homeNote:: onDisappear")
                hasAddedRecentNote = false
            }
        }
    }
}

#Preview {
    HomeNote(
        router: RouterImpl(),
        hasAddedRecentNote: .constant(false)
    )
}
