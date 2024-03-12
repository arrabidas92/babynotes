//
//  ContentView.swift
//  BabyNotes
//
//  Created by Alexandre DUARTE on 04/03/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            HeaderNote()
            HeaderSection(style: .cta)
                .padding(
                    EdgeInsets(
                        top: 16,
                        leading: 32,
                        bottom: 16,
                        trailing: 32
                    )
                )
        }
    }
}

#Preview {
    ContentView()
}
