//
//  PersistentStorage.swift
//  CRUD_List
//
//  Created by intekglobal02 on 1/25/24.
//

import Foundation
import CoreData

final class PersistentStorage {
    private init() {}
    
    static let shared = PersistentStorage()
    
    lazy var persistentContainer : NSPersistentContainer = {
        let container = NSPersistentContainer(name: "CRUD_List")
        container.loadPersistentStores { description, error in
            if let error = error  {
                fatalError("error: \(error)")
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
                let nserror = error as NSError
                fatalError("Error: \(error)")
            }
        }
    }
    
    
}
