//
//  TappableRowViewModifier.swift
//  TappableRowItemDemo
//
//  Created by Nikolai Nobadi on 4/27/25.
//

import SwiftUI

struct TappableRowViewModifier: ViewModifier {
    let tint: Color
    let tapIsActive: Bool
    let withChevron: Bool
    let maxWidth: CGFloat
    let alignment: Alignment
    let action: () -> Void
    
    func body(content: Content) -> some View {
        content
            .asRowItem(withChevron: withChevron, maxWidth: maxWidth, alignment: alignment, tint: tint)
            .modifier(TapModifier(isActive: tapIsActive, action: action))
    }
}

extension View {
    /// Configures the view as a tappable row item with customizable appearance and behavior.
    ///
    /// - Parameters:
    ///   - tapIsActive: A Boolean indicating whether the tap action is active.
    ///   - withChevron: A Boolean indicating if a chevron should be displayed on the right.
    ///   - maxWidth: The maximum width the view can occupy. Defaults to `.infinity`.
    ///   - tint: The tint color for the chevron, defaulting to primary.
    ///   - alignment: The alignment of the content within the row item, defaulting to leading.
    ///   - onTapGesture: The action to perform when the row is tapped.
    func tappable(
        tapIsActive: Bool = true,
        withChevron: Bool = false,
        maxWidth: CGFloat = .infinity,
        tint: Color = .primary,
        alignment: Alignment = .leading,
        onTapGesture: @escaping ()  -> Void
    ) -> some View {
        modifier(
            TappableRowViewModifier(
                tint: tint,
                tapIsActive: tapIsActive,
                withChevron: withChevron,
                maxWidth: maxWidth,
                alignment: alignment,
                action: onTapGesture
            )
        )
    }
}


// MARK: - Helpers
private struct TapModifier: ViewModifier {
    let isActive: Bool
    let action: () -> Void

    func body(content: Content) -> some View {
        if isActive {
            content
                .onTapGesture(perform: action)
        } else {
            content
        }
    }
}
