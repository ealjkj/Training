//
//  CDTaskRepository.swift
//  todoList
//
//  Created by intekglobal02 on 2/1/24.
//

import Foundation

protocol CDTaskRepository {
    func getAll() -> [CDTask]?
    func getOne(id: UUID) -> CDTask?
    func create(task: Task)
    func delete(task: Task) -> Bool
    func update(task: Task) -> Bool
}

class CDTaskRepositoryData: CDTaskRepository {
    func getAll() -> [CDTask]? {
        let fetchRequest = CDTask.fetchRequest()
        do {
            let result = try PersistentStorage.shared.context.fetch(fetchRequest)
            return result
        } catch {
            print("Error fetching: \(error)")
            return nil
        }
    }
    
    func getOne(id: UUID) -> CDTask? {
        let fetchRequest = CDTask.fetchRequest()
        print("id: ", id)
        
        let predicate = NSPredicate(format: "id == %@", id as NSUUID)
        fetchRequest.predicate = predicate
        
        do {
            let result = try PersistentStorage.shared.context.fetch(fetchRequest)
            print("Result:", result)
            return result.first
        } catch {
            return nil
        }
    }
    
    func create(task: Task) {
        print("create CDTask")
        
        let newTask = CDTask(context: PersistentStorage.shared.context)
        newTask.createdDate = task.createdDate
        newTask.completed = task.completed
        newTask.title = task.title
        newTask.id = task.id

        PersistentStorage.shared.save()
    }
    
    func delete(task: Task) -> Bool {
        guard let cdtask = getOne(id: task.id) else {return false}
        PersistentStorage.shared.context.delete(cdtask)
        PersistentStorage.shared.save()
        
        return false
    }
    
    func update(task: Task) -> Bool {
        if let cdtask = getOne(id: task.id) {
            cdtask.createdDate = task.createdDate
            cdtask.completed = task.completed
            cdtask.title = task.title
            
            PersistentStorage.shared.save()
            return true
        }
        
        return false
    }
    
    
}
