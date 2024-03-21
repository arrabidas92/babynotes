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
    
    var body: some View {
        Image(systemName: systemImageName)
            .tint(tint)
            .frame(width: width, height: width)
            .background(background)
            .clipShape(Circle())
            .overlay(content: {
                Circle()
                    .stroke(.white, lineWidth: 2)
            })
    }
}

#Preview {
    SystemIconButton(
        systemImageName: "arrow.triangle.2.circlepath",
        width: 50,
        tint: .white,
        background: .black
    )
}
