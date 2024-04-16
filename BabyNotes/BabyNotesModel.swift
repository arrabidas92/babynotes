//
//  BabyNotesModel.swift
//  BabyNotes
//
//  Created by Alexandre DUARTE on 16/04/2024.
//

import SwiftUI
import SwiftData

extension BabyNotesApp {
    @Observable class Model {
        var router = RouterImpl()
        var hasAddedRecentNote: Bool = false
    }
}
