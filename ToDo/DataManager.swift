//
//  ToDo.swift
//  ToDo
//
//  Created by Eralp Karaduman on 22.7.2020.
//

import Foundation
import CoreData

struct ToDoItem: Identifiable, Equatable {
    let id = UUID()
    let text: String
    var completed: Bool
}

class DataManager: ObservableObject {
    @Published private(set) var items: [ToDoItem]
    
    var moc = PersistentDataManager().persistentContainer.viewContext
    
    init() {
        let entities: [ToDoEntity] = try! self.moc.fetch(NSFetchRequest(entityName: "ToDoEntity"))
        self.items = entities.map { entity -> ToDoItem in
            ToDoItem(text: entity.text!, completed: entity.completed)
        }
    }
    
    func add(item: ToDoItem) {
        items.append(item)
        
        let entity = ToDoEntity(context: self.moc)
        entity.id = "\(item.id)"
        entity.completed = item.completed
        entity.text = item.text
        
        try? self.moc.save()
    }
    
    func remove(at indexSet: IndexSet) {
        indexSet.forEach { index in
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ToDoEntity")
            let textToRemove = items[index].text
            fetchRequest.predicate = NSPredicate(format: "text == %@", textToRemove)

            if let objectToDelete = try? moc.fetch(fetchRequest).first as? NSManagedObject {
                moc.delete(objectToDelete)
            }
        }

        items.remove(atOffsets: indexSet)

        try? moc.save()
    }
}
