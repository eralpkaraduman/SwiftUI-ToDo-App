//
//  ContentView.swift
//  Shared
//
//  Created by Eralp Karaduman on 11.7.2020.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var dataManager: DataManager

    var body: some View {
        NavigationView {
            TodoListView().environmentObject(dataManager)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static let dataManager = DataManager(items: [
        ToDoItem(text: "Buy Milk", completed: true),
        ToDoItem(text: "Buy Bread", completed: false),
        ToDoItem(text: "Buy Banana", completed: false),
        ToDoItem(text: "Buy Beer", completed: false),
        ToDoItem(text: "Buy Diapers", completed: false),
        ToDoItem(text: "Buy Peanuts", completed: false)
    ])
    static var previews: some View {
        ContentView().environmentObject(dataManager)
    }
}
