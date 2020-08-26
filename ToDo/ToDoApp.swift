//
//  ToDoApp.swift
//  ToDo
//
//  Created by Eralp Karaduman on 15.7.2020.
//

import SwiftUI
import CoreData

@main
struct ToDoApp: App {
    var manager = CoreDataManager()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(manager) // 🌸
        }
    }
}
