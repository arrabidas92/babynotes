//
//  ToolbarButton.swift
//  BabyNotes
//
//  Created by Alexandre DUARTE on 06/05/2024.
//

import SwiftUI

struct ToolbarIconButton: View {
    let systemIcon: String
    let isDisabled: Bool
    let role: ButtonRole?
    let onAction: () -> ()
    
    var body: some View {
        Button(role: role) {
            onAction()
        } label: {
            Image(systemName: systemIcon)
                .foregroundStyle(role == .destructive ? Color.red : Color.black)
        }
        .disabled(isDisabled)
    }
}

#Preview {
    ToolbarIconButton(systemIcon: "square.and.arrow.down", isDisabled: false, role: .cancel) { print("Click action") }
}
