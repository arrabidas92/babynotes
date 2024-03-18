//
//  AddNoteButton.swift
//  BabyNotes
//
//  Created by Alexandre DUARTE on 18/03/2024.
//

import SwiftUI

struct AddNoteButton: View {
    var body: some View {
        Image(systemName: "pencil.and.scribble")
            .tint(Color.black)
            .frame(width: 50, height: 50)
            .background(Color("babyYellow"))
            .clipShape(Circle())
            .overlay(content: {
                Circle()
                    .stroke(.white, lineWidth: 2)
            })
    }
}

#Preview {
    AddNoteButton()
}
