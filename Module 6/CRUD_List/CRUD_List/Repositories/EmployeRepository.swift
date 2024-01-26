//
//  EmployeRepository.swift
//  CRUD_List
//
//  Created by intekglobal02 on 1/25/24.
//

import Foundation
import CoreData

protocol EmployeeRepository : BaseRepository {
    func getAll() -> [CDEmployee]?
    func get(byIdentifier: UUID) -> CDEmployee?
    func create(employee: Employee)
    func update(employee: Employee) -> Bool
    func delete(employee: Employee) -> Bool
}


struct EmployeeDataRepository : EmployeeRepository {
    func getAll() -> [CDEmployee]? {
        let fetchRequest = CDEmployee.fetchRequest()
        
        do {
            let result = try PersistentStorage.shared.context.fetch(fetchRequest)
            return result
        } catch {
            print("Error fetching: \(error)")
            return nil
        }
    }
    
    func get(byIdentifier id: UUID) -> CDEmployee? {
        let fetchRequest = CDEmployee.fetchRequest()
        let predicate = NSPredicate(format: "id == %@", id.uuidString)
        fetchRequest.predicate = predicate
        
        do {
            let result = try PersistentStorage.shared.context.fetch(fetchRequest)
            return result.first
        } catch {
            return nil
        }
    }
    
    func create(employee: Employee)  {
        let cdemployee = CDEmployee(context: PersistentStorage.shared.context)
        cdemployee.configure(with: employee)
        PersistentStorage.shared.saveContext()
    }
    
    func update(employee: Employee) -> Bool {
        guard let cdemployee = get(byIdentifier: employee.id) else {return false}
        cdemployee.configure(with: employee)
        PersistentStorage.shared.saveContext()
        return true
    }
    
    func delete(employee: Employee) -> Bool{
        guard let cdemployee = get(byIdentifier: employee.id) else {return false}
        PersistentStorage.shared.context.delete(cdemployee)
        PersistentStorage.shared.saveContext()
        return true
    }
}
