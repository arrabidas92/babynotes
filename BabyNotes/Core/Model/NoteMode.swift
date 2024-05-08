//
//  NoteMode.swift
//  BabyNotes
//
//  Created by Alexandre DUARTE on 08/05/2024.
//

import SwiftUI

enum NoteMode {
    case add(Binding<Bool>)
    case edit(Note)
}
