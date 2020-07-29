//
//  AddToDoSheetContentView.swift
//  ToDo
//
//  Created by Eralp Karaduman on 23.7.2020.
//

// TODO: Delet Dis
import SwiftUI

struct AddToDoSheetContentView: View {
    @State var newItemTitle: String = ""
    @EnvironmentObject var dataManager: DataManager
    
    @Binding var isPresented: Bool
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("Add to do", text: $newItemTitle)
                    Button(action: addItem) {
                        Text("Add")
                    }
                }.padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, 20)
                Spacer()
            }.navigationBarTitle(Text("New To Do"))
        }
    }
    func addItem() {
        dataManager.add(
            item: ToDoItem(text: newItemTitle, completed: false)
        )
        isPresented.toggle()
    }
}
