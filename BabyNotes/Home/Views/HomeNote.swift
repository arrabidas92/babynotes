//
//  ContentView.swift
//  BabyNotes
//
//  Created by Alexandre DUARTE on 04/03/2024.
//

import OSLog
import SwiftUI
import SwiftData

//Check bindable to understand
//Check how to pass hasAddedRecentNote to decouple from route
struct HomeNote: View {
    @Bindable var router: RouterImpl
    @State private var vm = ViewModel()
    
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
                        data: $vm.recentNote,
                        hasAddedRecentNote: $vm.hasAddedRecentNote
                    )
                    HeaderSection(
                        title: "Category",
                        style: .none,
                        action: nil
                    )
                    NoteCategoryList(hasAddedRecentNote: $vm.hasAddedRecentNote)
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
                Logger.viewCycle.notice("homeNote::appeared")
                vm.fetchRecentNotes()
            }
            .onDisappear {
                Logger.viewCycle.notice("homeNote:: disappeared")
                vm.hasAddedRecentNote = false
            }
        }
    }
}

#Preview {
    HomeNote(router: RouterImpl())
}
