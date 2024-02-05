//
//  PersistentStorage.swift
//  todoList
//
//  Created by intekglobal02 on 2/1/24.
//

import Foundation
import CoreData

class PersistentStorage {
    
    static let shared = PersistentStorage()
    
    private init() {}

    lazy var persistentContainer : NSPersistentContainer = {
        let container = NSPersistentContainer(name: "todoList")
        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Error loading stores: \(error.localizedDescription)")
            }
        }
        return container
    }()
    
    lazy var context = persistentContainer.viewContext
    
    func save() {
        do {
            try context.save()
        } catch {
            fatalError("Error saving the data: \(error.localizedDescription)")
        }
    }
}


