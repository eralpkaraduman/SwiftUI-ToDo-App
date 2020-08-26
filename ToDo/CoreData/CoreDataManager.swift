//
//  CoreDataManager.swift
//  ToDo
//
//  Created by Eralp Karaduman on 26.8.2020.
//

import Foundation
import CoreData

class CoreDataManager: ObservableObject {
    @Published private(set) var items: [ToDoEntity] = []

    private let persistentContainer: NSPersistentCloudKitContainer = {
        let container = NSPersistentCloudKitContainer(name: "ToDo")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    private var managedContext: NSManagedObjectContext {
        persistentContainer.viewContext
    }

    init() {
        try? updateItems()
    }

    func addItem(with text: String) {
        let entity = ToDoEntity(
            entity: NSEntityDescription.entity(
                forEntityName: String(describing: ToDoEntity.self),
                in: managedContext)!,
            insertInto: managedContext)

        entity.text = text
        entity.completed = false

        try! saveContext()
        try! updateItems()
    }

    func removeItem(_ entity: ToDoEntity) {
        managedContext.delete(entity)
        try! saveContext()
        try! updateItems()
    }

    func toggleCompleted(_ entity: ToDoEntity) {
        entity.completed.toggle()
        try! saveContext()
        try! updateItems()
    }

    private func updateItems() throws {
        self.items = try managedContext.fetch(ToDoEntity.fetchRequest())
    }

    private func saveContext() throws {
        if managedContext.hasChanges {
            try managedContext.save()
        }
    }
}

