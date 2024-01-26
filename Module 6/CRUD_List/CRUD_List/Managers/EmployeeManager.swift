//
//  EmployeeManager.swift
//  CRUD_List
//
//  Created by intekglobal02 on 1/24/24.
//

import Foundation

class EmployeeManager {    
    static var employees = [Employee]()
    lazy var employeeRepository = EmployeeDataRepository()
    
    
    func getEmployee(id: UUID) -> Employee? {
        return employeeRepository.get(byIdentifier: id)?.toEmployee()
    }
    
    func getAllEmployees() -> [Employee]? {
        return employeeRepository.getAll()?.map { $0.toEmployee() }
    }
    
    func createEmployee(employee: Employee) {
        employeeRepository.create(employee: employee)
    }
    
    func deleteEmployee(employee: Employee) -> Bool {
        return employeeRepository.delete(employee: employee)
    }
    
    func updateEmployee(employee: Employee) -> Bool {
        return employeeRepository.update(employee: employee)
    }
    
}
