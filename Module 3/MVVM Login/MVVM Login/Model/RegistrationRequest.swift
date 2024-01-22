//
//  RegistrationRequest.swift
//  MVVM Login
//
//  Created by intekglobal02 on 1/19/24.
//

import Foundation

struct RegistrationRequest: Codable {
    let name: String
    let email: String
    let password: String
    let passwordConfirmation: String
}
