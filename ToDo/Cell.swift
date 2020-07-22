//
//  Cell.swift
//  ToDo
//
//  Created by Eralp Karaduman on 23.7.2020.
//

import SwiftUI

struct Cell: View {
    @State var item: ToDoItem
    
    var body: some View {
        HStack(content: {
            Text(item.text) // TODO: Strikethrough if completed
            Spacer()
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/ ) {
                Image(systemName: item.completed ?
                        "checkmark.square" :
                        "square"
                )
            }.onTapGesture
            {
                item.completed.toggle()
            }
        })
    }
}

struct Cell_Previews: PreviewProvider {
    static var previews: some View {
        Cell(item: ToDoItem(text: "Test", completed: false))
    }
}
