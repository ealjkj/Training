//
//  CDCreditCards+CoreDataProperties.swift
//  DeleteRulesDemo
//
//  Created by intekglobal02 on 1/26/24.
//
//

import Foundation
import CoreData


extension CDCreditCards {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDCreditCards> {
        return NSFetchRequest<CDCreditCards>(entityName: "CDCreditCards")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var cardNumber: String?
    @NSManaged public var holderNoAction: CDBankUser?
    @NSManaged public var holderNullify: CDBankUser?
    @NSManaged public var holderCascade: CDBankUser?
    @NSManaged public var holderDeny: CDBankUser?

}

extension CDCreditCards : Identifiable {

}
