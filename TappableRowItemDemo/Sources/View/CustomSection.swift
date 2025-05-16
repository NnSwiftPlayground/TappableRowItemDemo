//
//  CustomSection.swift
//  TappableRowItemDemo
//
//  Created by Nikolai Nobadi on 5/16/25.
//

import SwiftUI

struct CustomSection<Content: View>: View {
    let title: String
    let details: String
    let content: () -> Content
    
    init(_ title: String, details: String, @ViewBuilder content: @escaping () -> Content) {
        self.title = title
        self.details = details
        self.content = content
    }
    
    var body: some View {
        Section {
            content()
        } header: {
            Text(title)
        } footer: {
            Text(details)
                .foregroundStyle(.blue)
        }
    }
}
