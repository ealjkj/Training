//
//  RegistrationViewModel.swift
//  MVVM Login
//
//  Created by intekglobal02 on 1/18/24.
//

import Foundation

protocol RegistrationViewModelDelegate : AnyObject {
    func apiResponseStatus(isSuccessful: Bool, registrationResponse: RegistrationResponse?, error: APIError?) 
    
    func validationResult(result: ValidationResult)
}

class RegistrationViewModel : ObservableObject {
    private let registrationService: RegistrationService
    private let registrationValidation: RegistrationValidation
    weak var registrationDelegate: RegistrationViewModelDelegate?
    
    @Published var registrationRequest: RegistrationRequest? {
        didSet {
            validateRegistration()
        }
    }
    
    
    init(registrationService: RegistrationService, registrationValidation: RegistrationValidation) {
        self.registrationService = registrationService
        self.registrationValidation = registrationValidation
    }
    
    
    func signup() {
        registrationService.registrationRequest = registrationRequest
        registrationService.signup() {data in 
            switch data {
            case .success(let response):
                self.registrationDelegate?.apiResponseStatus(isSuccessful: true, registrationResponse: response, error: nil)
                
            case .failure(let error):
                print("vm error desc", error.localizedDescription)
                self.registrationDelegate?.apiResponseStatus(isSuccessful: false, registrationResponse: nil, error: error)
            }
        }
    }
    
    func validateRegistration() {
        registrationValidation.registerRequest = registrationRequest
        registrationDelegate?.validationResult(result: registrationValidation.validate())
    }
    
}
