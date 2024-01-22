//
//  AuthAPI.swift
//  MVVM Login
//
//  Created by intekglobal02 on 1/19/24.
//

import Foundation

enum AuthAPI {
    struct Endpoints {
        static let login = "http://localhost:3000/login"
        static let signup = "http://localhost:3000/signup"
        static let logout = "http://localhost:3000/logout"
    }
    
    enum Methods : String {
        case POST = "POST"
    }
}
