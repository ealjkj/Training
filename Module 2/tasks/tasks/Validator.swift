//
//  Validator.swift
//  tasks
//
//  Created by intekglobal02 on 1/17/24.
//

import Foundation

struct Validator {
    func validateEmail(_ email: String) -> Bool {
        guard let mailRegex = try? Regex(#"^([a-zA-Z0-9]+[._%+-]*)+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"#) else { fatalError("Invalid regex for email") }
        
        if email.firstMatch(of: mailRegex) != nil {
            return true
        }
        
        return false
    }
}


