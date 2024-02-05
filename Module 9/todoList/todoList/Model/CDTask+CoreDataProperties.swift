//
//  CDTask+CoreDataProperties.swift
//  todoList
//
//  Created by intekglobal02 on 2/1/24.
//
//

import Foundation
import CoreData


extension CDTask {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDTask> {
        return NSFetchRequest<CDTask>(entityName: "CDTask")
    }

    @NSManaged public var title: String?
    @NSManaged public var id: UUID?
    @NSManaged public var completed: Bool
    @NSManaged public var createdDate: Date?

}

extension CDTask : Identifiable {

}
