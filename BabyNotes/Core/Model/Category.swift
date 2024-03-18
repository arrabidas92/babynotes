//
//  Level.swift
//  BabyNotes
//
//  Created by Alexandre DUARTE on 18/03/2024.
//

import SwiftUI

enum Category: String, CaseIterable {
    case health, food, hygiene, furnitures, relax, night, awakening, baby_sitting
}

extension Category {
    var title: String {
        switch self {
        case .health:
            return "Santé"
        case .food:
            return "Nourriture"
        case .hygiene:
            return "Hygiène"
        case .furnitures:
            return "Équipements"
        case .relax:
            return "Relaxation"
        case .night:
            return "Nuit"
        case .awakening:
            return "Éveil"
        case .baby_sitting:
            return "Baby sitting"
        }
    }
    
    var color: Color {
        switch self {
        case .health:
            return Color("babyBlue")
        case .food:
            return Color("babyOrange")
        case .hygiene:
            return Color("babyTeal")
        case .furnitures:
            return Color("babyPink")
        case .relax:
            return Color("babyIndigo")
        case .night:
            return Color("babyDarkBlue")
        case .awakening:
            return Color("babyYellow")
        case .baby_sitting:
            return Color("babyDarkPink")
        }
    }
}
