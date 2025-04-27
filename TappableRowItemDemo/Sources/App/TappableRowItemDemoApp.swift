//
//  TappableRowItemDemoApp.swift
//  TappableRowItemDemo
//
//  Created by Nikolai Nobadi on 4/27/25.
//

import SwiftUI

@main
struct TappableRowItemDemoApp: App {
    var body: some Scene {
        WindowGroup {
            CategoryNavStack(viewModel: .init(categories: MyCategory.sampleList))
        }
    }
}
