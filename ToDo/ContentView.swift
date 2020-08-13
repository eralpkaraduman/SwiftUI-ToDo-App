//
//  ContentView.swift
//  Shared
//
//  Created by Eralp Karaduman on 11.7.2020.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @EnvironmentObject var dataManager: DataManager
    
    var body: some View {
        NavigationView {
            TodoListView().environmentObject(dataManager)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static let dataManager = DataManager()
    static var previews: some View {
        ContentView().environmentObject(dataManager)
    }
}
