//
//  SystemIconButton.swift
//  BabyNotes
//
//  Created by Alexandre DUARTE on 21/03/2024.
//

import SwiftUI

struct SystemIconButton: View {
    let systemImageName: String
    let width: CGFloat
    let tint: Color
    let background: Color
    let action: () -> ()
    
    var body: some View {
        Image(systemName: systemImageName)
            .frame(width: width, height: width)
            .background(background)
            .foregroundStyle(tint)
            .clipShape(Circle())
            .overlay(content: {
                Circle()
                    .stroke(.white, lineWidth: 2)
            })
            .onTapGesture { action() }
    }
}

#Preview {
    SystemIconButton(
        systemImageName: "arrow.triangle.2.circlepath",
        width: 50,
        tint: .white,
        background: .black,
        action: { print("Tap SystemIconButton") }
    )
}
