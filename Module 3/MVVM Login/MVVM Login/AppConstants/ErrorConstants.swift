//
//  ErrorConstants.swift
//  MVVM Login
//
//  Created by intekglobal02 on 1/18/24.
//

import Foundation

enum ErrorConstants : String {
    
    case decodingError = "There was an error decoding the data"
    case encodingError = "There was an error encoding the data"
    
    case communicationError = "There was an error communicating with the server"
    case invalidCredentialsError = "Credentials are invalid"
    case internalServerError = "Internal serverError"
    
    case invalidName = "Invalid name"
    case invalidEmail = "Invalid email"
    case invalidPassword = "Invalid password"
    case passwordDontMatch = "Passwords must match"
    
}
