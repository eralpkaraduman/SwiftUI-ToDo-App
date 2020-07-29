//
//  NewToDoInputCell.swift
//  ToDo
//
//  Created by Eralp Karaduman on 29.7.2020.
//

import SwiftUI
import Introspect

struct NewToDoInputCell: View {
    @State var newItemTitle: String = ""
    var onCommit: (String) -> Void
    
    var body: some View {
        TextField("Add to do", text: $newItemTitle) { _ in
            
        } onCommit: {
            onCommit(self.newItemTitle.trimmingCharacters(
                in: .whitespacesAndNewlines
            ));
            self.newItemTitle = ""
        }.introspectTextField { textField in
            textField.returnKeyType = .done
            textField.becomeFirstResponder()
        }
    }
}
