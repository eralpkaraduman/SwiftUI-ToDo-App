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
    var toDo = DataManager()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(toDo)
        }
    }
}
