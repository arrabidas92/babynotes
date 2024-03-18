//
//  ContentView.swift
//  BabyNotes
//
//  Created by Alexandre DUARTE on 04/03/2024.
//

import SwiftUI

struct HomeNote: View {
    var body: some View {
        ZStack(alignment: .bottomTrailing, content: {
            ScrollView {
                HeaderNote()
                HeaderSection(style: .text)
                    .padding(
                        EdgeInsets(
                            top: 16,
                            leading: 32,
                            bottom: 16,
                            trailing: 32
                        )
                    )
            }
            NavigationLink(
                destination: AddNote()
            ) {
                AddNoteButton()
                    .padding(.trailing, 32)
            }
        })
    }
}

#Preview {
    HomeNote()
}
