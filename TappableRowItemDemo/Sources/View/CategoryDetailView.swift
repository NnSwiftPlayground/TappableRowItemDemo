//
//  CategoryDetailView.swift
//  TappableRowItemDemo
//
//  Created by Nikolai Nobadi on 4/27/25.
//

import SwiftUI

struct CategoryDetailView: View {
    @State var category: MyCategory
    @Environment(\.dismiss) private var dismiss
    
    let saveCategory: (MyCategory) -> Void
    
    var body: some View {
        List {
            CustomSection("Tappable", details: "Can tap anywhere to trigger action") {
                ForEach(MyItem.sampleList) { item in
                    ItemRow(item: item, isSelected: category.selectedItems.contains(item))
                        // 🟢 Primary Feature: Ensures entire row is tappable
                        .tappable {
                            category.selectedItems.toggle(item)
                        }
                }
            }
            
            CustomSection("OnTapGesture", details: "Tap action only triggers when directly tapping the text.") {
                ForEach(MyItem.secondaryList) { item in
                    ItemRow(item: item, isSelected: category.selectedItems.contains(item))
                        .onTapGesture {
                            category.selectedItems.toggle(item)
                        }
                }
            }
        }
        .navigationTitle(category.name)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Save") {
                    saveCategory(category)
                    dismiss()
                }
            }
        }
    }
}


// MARK: - ItemRow
private struct ItemRow: View {
    let item: MyItem
    let isSelected: Bool
    
    var body: some View {
        HStack {
            Text(item.name)
            Spacer()
            if isSelected {
                Image(systemName: "checkmark")
                    .foregroundColor(.blue)
            }
        }
    }
}


// MARK: - Preview
#Preview {
    CategoryDetailView(category: .sample, saveCategory: { _ in })
}


// MARK: - Extension Dependencies
private extension Set {
    mutating func toggle(_ element: Element) {
        if contains(element) {
            remove(element)
        } else {
            insert(element)
        }
    }
}
