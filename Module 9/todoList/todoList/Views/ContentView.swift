//
//  ContentView.swift
//  todoList
//
//  Created by intekglobal02 on 2/1/24.
//

import SwiftUI
import CoreData

struct ContentView: View {
     
    var body: some View {
        TabView {
            TodoList()
                .tabItem {
                    Label("Todo List", systemImage: "largecircle.fill.circle")
                }
            
            SearchTaskView()
                .tabItem {
                    Label("Search Item", systemImage: "magnifyingglass.circle.fill")
                }
            
            
        }
    }
}

#Preview {
    ContentView()
}
