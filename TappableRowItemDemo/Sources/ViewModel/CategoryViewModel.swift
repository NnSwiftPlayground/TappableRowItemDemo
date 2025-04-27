//
//  CategoryViewModel.swift
//  TappableRowItemDemo
//
//  Created by Nikolai Nobadi on 4/27/25.
//

import Foundation

final class CategoryViewModel: ObservableObject {
    @Published var categories: [MyCategory]
    
    init(categories: [MyCategory]) {
        self.categories = categories
    }
}


// MARK: - Actions
extension CategoryViewModel {
    func saveCategory(_ category: MyCategory) {
        if let index = categories.firstIndex(where: { $0.id == category.id }) {
            categories[index] = category
        }
    }
}
