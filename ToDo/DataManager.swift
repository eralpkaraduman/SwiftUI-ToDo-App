//
//  ToDo.swift
//  ToDo
//
//  Created by Eralp Karaduman on 22.7.2020.
//

import Foundation

struct ToDoItem: Identifiable, Equatable {
    let id = UUID()
    let text: String
    var completed: Bool
}

class DataManager: ObservableObject {
    @Published private(set) var items: [ToDoItem]
    
    init(items: [ToDoItem] = []) {
        self.items = items
    }
    
    func add(item: ToDoItem) {
        items.append(item)
    }
    
    func remove(at indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
}
