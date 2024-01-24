//
//  RegistrationMockService.swift
//  MVVM Login
//
//  Created by intekglobal02 on 1/24/24.
//

import Foundation

class RegistrationMockService : RegistrationService {
    
    var registrationRequest: RegistrationRequest?
    
    override func signup(registrationRequest: RegistrationRequest, completion: @escaping (_ data: Result<RegistrationResponse, APIError>) -> Void) {
        completion(.success(RegistrationResponse(success: true, errorMessage: nil)))
    }
}

class RegistrationViewModelMockDelegate : RegistrationViewModelDelegate {    
    func validationResult(result: ValidationResult) {
        
    }
    

}
