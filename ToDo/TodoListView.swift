//
//  TodoListView.swift
//  ToDo
//
//  Created by Eralp Karaduman on 23.7.2020.
//

import SwiftUI

struct TodoListView: View {
    @EnvironmentObject var dataManager: DataManager
    @State var addMode = false

    var body: some View {
        List() {
            Section{
                ForEach(dataManager.items) { item in
                    Cell(item: item)
                }.onDelete(perform: dataManager.remove)
            }
            if addMode {
                Section {
                    NewToDoInputCell { title in
                        addMode.toggle()
                        if title.isEmpty {
                            return
                        }
                        dataManager.add(
                            item: ToDoItem(text: title, completed: false)
                        )
                    }
                }
            }
        }.listStyle(PlainListStyle())
        .navigationTitle("TO DO")
        .navigationBarItems(trailing:
            Button(action: {
                self.addMode.toggle()
            }, label: {
                Text("Add")
            }).disabled(addMode)
        )
    }
}

struct TodoListView_Previews: PreviewProvider {
    static let dataManager = DataManager()
    static var previews: some View {
        TodoListView().environmentObject(dataManager)
    }
}
