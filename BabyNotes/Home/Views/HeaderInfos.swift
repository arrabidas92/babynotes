//
//  HeaderInfos.swift
//  BabyNotes
//
//  Created by Alexandre DUARTE on 04/03/2024.
//

import SwiftUI

struct HeaderInfos: View {
    var body: some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading, spacing: 8.0, content: {
                Text("Hello, Alex!")
                    .font(.title3)
                    .foregroundStyle(Color.gray.secondary)
                    .bold()
                Text("My Notes")
                    .font(.largeTitle)
            })
            Spacer()
            Image("profile")
                .resizable()
                .frame(width: 48, height: 48)
        }
    }
}

#Preview {
    HeaderInfos()
}