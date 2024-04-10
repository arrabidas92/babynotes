//
//  HeaderSection.swift
//  BabyNotes
//
//  Created by Alexandre DUARTE on 12/03/2024.
//

import SwiftUI

struct HeaderSection: View {
    let title: String
    let style: HeaderStyle
    let action: (() -> ())?
    
    var body: some View {
        HStack {
            Text(title)
                .font(.headline)
            Spacer()
            switch style {
            case .text:
                Button {
                    action?()
                } label: {
                    Text("See all")
                        .font(.footnote)
                        .foregroundStyle(Color.gray)
                }
            case .cta:
                Button(action: {
                    action?()
                }) {
                    Image(systemName: "plus.app")
                        .tint(Color.black)
                }
            case .none:
                EmptyView()
            }
        }
        .padding(
            EdgeInsets(
                top: 8,
                leading: 32,
                bottom: 8,
                trailing: 32
            )
        )
    }
}

#Preview {
    HeaderSection(
        title: "Recent",
        style: .text,
        action: nil
    )
}
