//
//  CategoryNavStack.swift
//  TappableRowItemDemo
//
//  Created by Nikolai Nobadi on 4/27/25.
//

import SwiftUI

struct CategoryNavStack: View {
    @State private var path = NavigationPath()
    @StateObject var viewModel: CategoryViewModel
    
    var body: some View {
        NavigationStack(path: $path) {
            List {
                ForEach(viewModel.categories) { category in
                    CategoryRow(category: category)
                        // 🟢 Primary Feature: Ensures entire row is tappable
                        .tappable(withChevron: true) {
                            path.append(category)
                        }
                }
            }
            .navigationTitle("Categories")
            .navigationDestination(for: MyCategory.self) { category in
                CategoryDetailView(category: category, saveCategory: viewModel.saveCategory(_:))
            }
        }
    }
}


// MARK: - CategoryRow
private struct CategoryRow: View {
    let category: MyCategory
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(category.name)
            
            if let itemCountText = category.selectedItemCountText {
                Text(itemCountText)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
        }
    }
}


// MARK: - Preview
#Preview {
    CategoryNavStack(viewModel: .init(categories: MyCategory.sampleList))
}


// MARK: - Extension Dependencies
private extension MyCategory {
    var selectedItemCountText: String? {
        return selectedItems.isEmpty ? nil : "\(selectedItems.count) \("item".pluralized(for: selectedItems.count))"
    }
}

private extension String {
    func pluralized(for count: Int) -> String {
        count == 1 ? self : self + "s"
    }
}
