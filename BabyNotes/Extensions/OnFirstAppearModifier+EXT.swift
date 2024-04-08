//
//  OnFirstAppearModifier+EXT.swift
//  BabyNotes
//
//  Created by Alexandre DUARTE on 08/04/2024.
//

import SwiftUI

public struct OnFirstAppearModifier: ViewModifier {

    private let onFirstAppearAction: () -> ()
    @State private var hasAppeared = false
    
    public init(_ onFirstAppearAction: @escaping () -> ()) {
        self.onFirstAppearAction = onFirstAppearAction
    }
    
    public func body(content: Content) -> some View {
        content
            .onAppear {
                guard !hasAppeared else { return }
                hasAppeared = true
                onFirstAppearAction()
            }
    }
}

extension View {
    func onFirstAppear(_ onFirstAppearAction: @escaping () -> ()) -> some View {
        return modifier(
            OnFirstAppearModifier(onFirstAppearAction)
        )
    }
}
