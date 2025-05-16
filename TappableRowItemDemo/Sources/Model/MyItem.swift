//
//  MyItem.swift
//  TappableRowItemDemo
//
//  Created by Nikolai Nobadi on 4/27/25.
//

struct MyItem: Identifiable, Hashable {
    let id: Int
    let name: String
}


// MARK: - Helpers
extension MyItem {
    static var sampleList: [MyItem] {
        return [
            .init(id: 1, name: "Apple"),
            .init(id: 2, name: "Banana"),
            .init(id: 3, name: "Cherry")
        ]
    }
    
    static var secondaryList: [MyItem] {
        return [
            .init(id: 1, name: "Asparagus"),
            .init(id: 2, name: "Brocolli"),
            .init(id: 3, name: "Cucumber")
        ]
    }
}
