//
//  NoteRepository.swift
//  BabyNotes
//
//  Created by Alexandre DUARTE on 08/04/2024.
//

import Foundation

protocol NoteRepository {
    func fetchNotes(limit: Int) -> [Note]
    func addNote(_ note: Note)
    func fetchNumberOfNotes(idCategory: String) -> Int
}
