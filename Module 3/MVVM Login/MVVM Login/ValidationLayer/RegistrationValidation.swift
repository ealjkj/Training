//
//  RegistrationValidation.swift
//  MVVM Login
//
//  Created by intekglobal02 on 1/18/24.
//

import Foundation

struct ValidationResult {
    let success: Bool
    var errorMessage: String?
}

class RegistrationValidation {
    var registerRequest: RegistrationRequest?
    
    func validate() -> ValidationResult {
        
        guard let registerRequest = registerRequest else { return ValidationResult(success: false, errorMessage: "") }
        
        let validNameMatch = try! Regex(RegexConstants.name.rawValue).firstMatch(in: registerRequest.name) != nil
        let validEmailMatch = try! Regex(RegexConstants.email.rawValue).firstMatch(in: registerRequest.email) != nil
        let validPasswordMatch = try! Regex(RegexConstants.password.rawValue).firstMatch(in: registerRequest.password) != nil
        let passwordsMatch = registerRequest.password == registerRequest.passwordConfirmation
        
        if(!validNameMatch) {
            return ValidationResult(success: false, errorMessage: ErrorConstants.invalidName.rawValue)
        }
        
        if(!validPasswordMatch) {
            return ValidationResult(success: false, errorMessage: ErrorConstants.invalidPassword.rawValue)
        }
        
        if(!validEmailMatch) {
            return ValidationResult(success: false, errorMessage: ErrorConstants.invalidEmail.rawValue)
        }
        
        if(!passwordsMatch) {
            return ValidationResult(success: false, errorMessage: ErrorConstants.passwordDontMatch.rawValue)
        }

        return ValidationResult(success: true)
    }
    
}
