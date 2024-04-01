//
//  HeaderSection.swift
//  BabyNotes
//
//  Created by Alexandre DUARTE on 12/03/2024.
//

import SwiftUI

struct HeaderSection: View {
    let style: HeaderStyle
    
    var body: some View {
        HStack {
            Text("Recent")
                .font(.headline)
            Spacer()
            switch style {
            case .text:
                Button {
                    //TODO: implement action du bouton
                } label: {
                    Text("See all")
                        .font(.footnote)
                        .foregroundStyle(Color.gray)
                }
            case .cta:
                Button(action: {
                    // Action du bouton
                }) {
                    Image(systemName: "plus.app")
                        .tint(Color.black)
                }
            }
        }
        .padding(
            EdgeInsets(
                top: 16,
                leading: 32,
                bottom: 8,
                trailing: 32
            )
        )
    }
}

#Preview {
    HeaderSection(style: .text)
}
