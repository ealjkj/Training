//
//  PersistentStorage.swift
//  DeleteRulesDemo
//
//  Created by intekglobal02 on 1/26/24.
//

import Foundation
import CoreData

class PersistentStorage {
    private init() {}
    
    static let shared = PersistentStorage()
    
    lazy var persistentContainer = {
        let container = NSPersistentContainer(name: "DeleteRulesDemoTests")
        container.loadPersistentStores { storeDescription, error in
            if let error = error {
                fatalError("Unsolved error: \(error)")
            }
        }
        return container
    }()
    
    lazy var context = persistentContainer.viewContext
    
    func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                fatalError("Unable to save changes due to error: \(error)")
            }
        }
    }

}
