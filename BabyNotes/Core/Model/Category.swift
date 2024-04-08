//
//  Level.swift
//  BabyNotes
//
//  Created by Alexandre DUARTE on 18/03/2024.
//

import SwiftUI

enum Category: String, CaseIterable, Codable {
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
    
    var colorName: String {
        switch self {
        case .health:
            return "babyBlue"
        case .food:
            return "babyOrange"
        case .hygiene:
            return "babyTeal"
        case .furnitures:
            return "babyPink"
        case .relax:
            return "babyIndigo"
        case .night:
            return "babyDarkBlue"
        case .awakening:
            return "babyYellow"
        case .baby_sitting:
            return "babyDarkPink"
        }
    }
    
    var emoji: String {
        switch self {
        case .health:
            return "❤️"
        case .food:
            return "🥗"
        case .hygiene:
            return "🛁"
        case .furnitures:
            return "📦"
        case .relax:
            return "😌"
        case .night:
            return "🌙"
        case .awakening:
            return "💭"
        case .baby_sitting:
            return "👩‍🍼"
        }
    }
}
