//
//  todoListApp.swift
//  todoList
//
//  Created by intekglobal02 on 2/1/24.
//

import SwiftUI

@main
struct todoListApp: App {
//    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environment(\.managedObjectContext, PersistentStorage.shared.context)
        }
    }
}
