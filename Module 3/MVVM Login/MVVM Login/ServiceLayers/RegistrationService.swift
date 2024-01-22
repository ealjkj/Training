//
//  RegistrationService.swift
//  MVVM Login
//
//  Created by intekglobal02 on 1/18/24.
//

import Foundation

struct RegistrationResponse : Decodable {
    let success: Bool?
    let errorMessage: String?
}

class RegistrationService {
    var registrationRequest: RegistrationRequest?
    let httpUtility: HttpUtility
    
    init(httpUtility: HttpUtility) {
        self.httpUtility = httpUtility
    }
    
    func signup(completion: @escaping (_ data: Result<RegistrationResponse, APIError>) -> Void) {
        guard let registrationRequest = registrationRequest else {return}
        
        httpUtility.request(method: AuthAPI.Methods.POST, body: registrationRequest, endpoint: AuthAPI.Endpoints.signup) { (res: RegistrationResponse?, error: Error?) -> Void in
            
            print(res)
            
            if  res?.success != nil {
                completion(Result.success(res!))
                return
            }
            
            if let errorMessage = res?.errorMessage {
                print("Error message", errorMessage)
                let error = APIError(localizedDescription: errorMessage)
                print("error message after", error.localizedDescription)
                completion(Result.failure(error))
                return
            }
            
            if error != nil {
                let error = APIError(localizedDescription: ErrorConstants.communicationError.rawValue)
                completion(Result.failure(error))
                return
            }
            
        }
    }
    
}
