//
//  BaseRepository.swift
//  CRUD_List
//
//  Created by intekglobal02 on 1/25/24.
//

import Foundation

protocol BaseRepository {
    associatedtype T
    associatedtype CDT
    
    func getAll() -> [CDT]?
    func get(byIdentifier: UUID) -> CDT?
    func create(employee: T)
    func update(employee: T) -> Bool
    func delete(employee: T) -> Bool
}
