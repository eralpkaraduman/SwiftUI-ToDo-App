//
//  PersistentDataManager.swift
//  ToDo
//
//  Created by Eralp Karaduman on 13.8.2020.
//

// Based on: https://www.donnywals.com/using-core-data-with-swiftui-2-0-and-xcode-12/

import SwiftUI
import CoreData

class PersistentDataManager {
    let persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "ToDo")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    init() {
        let center = NotificationCenter.default
        let notification = UIApplication.willResignActiveNotification
        
        center.addObserver(forName: notification, object: nil, queue: nil) { [weak self] _ in
            guard let self = self else { return }
            
            if self.persistentContainer.viewContext.hasChanges {
                try? self.persistentContainer.viewContext.save()
            }
        }
    }
}
