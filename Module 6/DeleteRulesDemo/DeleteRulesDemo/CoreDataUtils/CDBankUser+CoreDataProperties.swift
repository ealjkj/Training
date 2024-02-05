//
//  CDBankUser+CoreDataProperties.swift
//  DeleteRulesDemo
//
//  Created by intekglobal02 on 1/26/24.
//
//

import Foundation
import CoreData


extension CDBankUser {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDBankUser> {
        return NSFetchRequest<CDBankUser>(entityName: "CDBankUser")
    }

    @NSManaged public var name: String?
    @NSManaged public var id: UUID?
    @NSManaged public var cardsNoAction: NSSet?
    @NSManaged public var cardsNullify: NSSet?
    @NSManaged public var cardsCascade: NSSet?
    @NSManaged public var cardsDeny: NSSet?

}

// MARK: Generated accessors for cardsNoAction
extension CDBankUser {

    @objc(addCardsNoActionObject:)
    @NSManaged public func addToCardsNoAction(_ value: CDCreditCards)

    @objc(removeCardsNoActionObject:)
    @NSManaged public func removeFromCardsNoAction(_ value: CDCreditCards)

    @objc(addCardsNoAction:)
    @NSManaged public func addToCardsNoAction(_ values: NSSet)

    @objc(removeCardsNoAction:)
    @NSManaged public func removeFromCardsNoAction(_ values: NSSet)

}

// MARK: Generated accessors for cardsNullify
extension CDBankUser {

    @objc(addCardsNullifyObject:)
    @NSManaged public func addToCardsNullify(_ value: CDCreditCards)

    @objc(removeCardsNullifyObject:)
    @NSManaged public func removeFromCardsNullify(_ value: CDCreditCards)

    @objc(addCardsNullify:)
    @NSManaged public func addToCardsNullify(_ values: NSSet)

    @objc(removeCardsNullify:)
    @NSManaged public func removeFromCardsNullify(_ values: NSSet)

}

// MARK: Generated accessors for cardsCascade
extension CDBankUser {

    @objc(addCardsCascadeObject:)
    @NSManaged public func addToCardsCascade(_ value: CDCreditCards)

    @objc(removeCardsCascadeObject:)
    @NSManaged public func removeFromCardsCascade(_ value: CDCreditCards)

    @objc(addCardsCascade:)
    @NSManaged public func addToCardsCascade(_ values: NSSet)

    @objc(removeCardsCascade:)
    @NSManaged public func removeFromCardsCascade(_ values: NSSet)

}

// MARK: Generated accessors for cardsDeny
extension CDBankUser {

    @objc(addCardsDenyObject:)
    @NSManaged public func addToCardsDeny(_ value: CDCreditCards)

    @objc(removeCardsDenyObject:)
    @NSManaged public func removeFromCardsDeny(_ value: CDCreditCards)

    @objc(addCardsDeny:)
    @NSManaged public func addToCardsDeny(_ values: NSSet)

    @objc(removeCardsDeny:)
    @NSManaged public func removeFromCardsDeny(_ values: NSSet)

}

extension CDBankUser : Identifiable {

}
