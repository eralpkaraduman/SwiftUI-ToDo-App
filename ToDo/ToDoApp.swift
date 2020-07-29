//
//  ToDoApp.swift
//  ToDo
//
//  Created by Eralp Karaduman on 15.7.2020.
//

import SwiftUI

@main
struct ToDoApp: App {
    var toDo = DataManager(items: [
        ToDoItem(text: "Buy Milk", completed: true),
        ToDoItem(text: "Buy Bread", completed: false),
//        ToDoItem(text: "Buy Banana", completed: false),
//        ToDoItem(text: "Buy Beer", completed: false),
//        ToDoItem(text: "Buy Beer", completed: false),
//        ToDoItem(text: "Buy Diapers", completed: false),
//        ToDoItem(text: "Buy Peanuts", completed: false)
    ])
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(toDo)
        }
    }
}
