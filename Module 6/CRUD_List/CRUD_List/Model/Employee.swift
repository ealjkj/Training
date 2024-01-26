//
//  Employee.swift
//  CRUD_List
//
//  Created by intekglobal02 on 1/25/24.
//

import Foundation

struct Employee : Identifiable {
    var id = UUID()
    let name: String
    let role: String
    let photo: Data?
}


