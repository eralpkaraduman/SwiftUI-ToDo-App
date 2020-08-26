//
//  TodoListView.swift
//  ToDo
//
//  Created by Eralp Karaduman on 23.7.2020.
//

import SwiftUI

struct TodoListView: View {
    @EnvironmentObject var dataManager: CoreDataManager
    @State var addMode = false

    var body: some View {
        List() {
            Section{
                ForEach(dataManager.items) { item in
                    Cell(item: item) {
                        self.toggleCompleted(of: item)
                    }
                }.onDelete(perform: self.delete)
            }
            if addMode {
                Section {
                    NewToDoInputCell { text in
                        addMode.toggle()
                        self.addItem(text)
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

    func delete(at indexSet: IndexSet) {
        guard let index = indexSet.first else {
            return
        }

        dataManager.removeItem(dataManager.items[index])
    }

    func addItem(_ text: String) { // 🌹
        if text.isEmpty {
            return
        }
        dataManager.addItem(with: text)
    }

    func toggleCompleted(of entity: ToDoEntity) {
        dataManager.toggleCompleted(entity)
    }
}

//struct TodoListView_Previews: PreviewProvider {
//    static let dataManager = DataManager()
//    static var previews: some View {
//        TodoListView().environmentObject(dataManager)
//    }
//}
