//
//  CDEmployee+CoreDataProperties.swift
//  CRUD_List
//
//  Created by intekglobal02 on 1/25/24.
//
//

import Foundation
import CoreData


extension CDEmployee {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDEmployee> {
        return NSFetchRequest<CDEmployee>(entityName: "CDEmployee")
    }

    @NSManaged public var name: String
    @NSManaged public var photo: Data?
    @NSManaged public var role: String
    @NSManaged public var id: String

}

extension CDEmployee : Identifiable {
    func toEmployee() -> Employee {
        return Employee(id: UUID(uuidString: self.id)!, name: self.name, role:  self.role, photo: self.photo)
    }
    
    func configure(with employee: Employee) {
        self.id = employee.id.uuidString
        self.name = employee.name
        self.photo = employee.photo
        self.role = employee.role
    }
}
