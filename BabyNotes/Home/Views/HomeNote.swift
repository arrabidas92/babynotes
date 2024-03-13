//
//  ContentView.swift
//  BabyNotes
//
//  Created by Alexandre DUARTE on 04/03/2024.
//

import SwiftUI

struct HomeNote: View {
    var body: some View {
        NavigationView(content: {
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
                NavigationLink(destination: AddNote()) { Image(systemName: "pencil.and.scribble")
                        .tint(Color.black)
                        .frame(width: 50, height: 50)
                        .background(Color("yellow"))
                        .clipShape(Circle())
                        .overlay(content: {
                            Circle()
                                .stroke(.white, lineWidth: 2)
                        })
                        .padding(.trailing, 32)
                }
            })
        })
    }
}

#Preview {
    HomeNote()
}
