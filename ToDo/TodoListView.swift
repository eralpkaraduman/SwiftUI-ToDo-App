//
//  TodoListView.swift
//  ToDo
//
//  Created by Eralp Karaduman on 23.7.2020.
//

import SwiftUI

struct TodoListView: View {
    @EnvironmentObject var dataManager: DataManager

    var body: some View {
        List() {
            ForEach(dataManager.items) { item in
                Cell(item: item)
            }.onDelete(perform: dataManager.remove)
        }
    }
}
