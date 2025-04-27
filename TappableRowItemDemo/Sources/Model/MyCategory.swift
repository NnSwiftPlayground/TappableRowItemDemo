//
//  MyCategory.swift
//  TappableRowItemDemo
//
//  Created by Nikolai Nobadi on 4/27/25.
//

struct MyCategory: Identifiable, Hashable {
    let id: Int
    let name: String
    var selectedItems: Set<MyItem> = []
}


// MARK: - Helpers
extension MyCategory {
    static var sample: MyCategory {
        return .init(id: 0, name: "Sample Category")
    }
    
    static var sampleList: [MyCategory] {
        return [
            .init(id: 1, name: "Fruits"),
            .init(id: 2, name: "Vegetables"),
            .init(id: 3, name: "Desserts")
        ]
    }
}
