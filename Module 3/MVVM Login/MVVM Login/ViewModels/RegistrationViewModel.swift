//
//  RegistrationViewModel.swift
//  MVVM Login
//
//  Created by intekglobal02 on 1/18/24.
//

import Foundation

protocol RegistrationViewModelDelegate : AnyObject {
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
    
    
    func signup(completion: @escaping (_ data: Result<RegistrationResponse, APIError>) -> Void) {
        guard let registrationRequest else {  completion(.failure(APIError(localizedDescription: ErrorConstants.invalidRegistrationRequest.rawValue)))
            return
        }
        
        registrationService.signup(registrationRequest: registrationRequest) {data in
            switch data {
            case .success(let response):
                completion(.success(response))
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func validateRegistration() {
        registrationValidation.registerRequest = registrationRequest
        registrationDelegate?.validationResult(result: registrationValidation.validate())
    }
    
}
