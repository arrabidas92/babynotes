//
//  AddNote.swift
//  BabyNotes
//
//  Created by Alexandre DUARTE on 13/03/2024.
//

import SwiftUI
//TODO: Refactor Image to reuse same one injecting system name string
//TODO: change back title to french one
//TODO: save note using SwiftData to have them locally
struct AddNote: View {
    @State private var vm = ViewModel()
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            VStack(alignment: .leading) {
                TitleTextField(title: $vm.noteTitle, nbLimitCaracters: 50)
                ContentTextEditor(content: $vm.noteContent)
            }
            Button {
                print(vm.noteTitle)
            } label: {
                Image(systemName: "arrow.triangle.2.circlepath")//TO refactor
                    .tint(Color.white)
                    .frame(width: 50, height: 50)
                    .background(Color.black)
                    .clipShape(Circle())
                    .overlay(content: {
                        Circle()
                            .stroke(.white, lineWidth: 2)
                    })
            }
            .padding(.trailing, 32)

        }
        .navigationTitle("Créer une note")
        .toolbar {
            ToolbarItem(placement: ToolbarItemPlacement.navigationBarTrailing) {
                CategoryPicker(selectedCategory: $vm.selectedCategory)
            }
        }
    }
}

#Preview {
    AddNote()
}
