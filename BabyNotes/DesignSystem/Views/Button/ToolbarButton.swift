//
//  ToolbarButton.swift
//  BabyNotes
//
//  Created by Alexandre DUARTE on 06/05/2024.
//

import SwiftUI

struct ToolbarButton: View {
    let label: String
    let isDisabled: Bool
    let onAction: () -> ()
    
    var body: some View {
        let _ = Self._printChanges()
        Button {
            onAction()
        } label: {
            Text(label)
        }
        .disabled(isDisabled)
    }
}

#Preview {
    ToolbarButton(label: "Action", isDisabled: false) { print("Click action") }
}
