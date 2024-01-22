//
//  RegexConstants.swift
//  MVVM Login
//
//  Created by intekglobal02 on 1/18/24.
//

import Foundation

enum RegexConstants : String {
    case name = #"^[a-zA-Z]+(?: [a-zA-Z]+)?$"#
    case password = #"^[^\s]{8,}$"#
    case email = #"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"#
}
