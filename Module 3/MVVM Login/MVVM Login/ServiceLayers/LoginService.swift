//
//  RegistrationService.swift
//  MVVM Login
//
//  Created by intekglobal02 on 1/18/24.
//

import Foundation

struct LoginResponse : Decodable {
    let user: User?
    let errorMessage: String?
}

class LoginService {
    var loginRequest: LoginRequest?
    let httpUtility: HttpUtility
    
    init(httpUtility: HttpUtility) {
        self.httpUtility = httpUtility
    }
    
    func login(completion: @escaping (_ data: Result<User, APIError>) -> Void) {
        guard let loginRequest = loginRequest else {return}
        
        httpUtility.request(method: AuthAPI.Methods.POST, body: loginRequest, endpoint: AuthAPI.Endpoints.login) { (res: LoginResponse?, error: Error?) -> Void in
            
            if let user = res?.user {
                self.saveToken(loginRequest)
                completion(Result.success(user))
                return
            }
            
            if let errorMessage = res?.errorMessage {
                let error = APIError(localizedDescription: errorMessage)
                completion(Result.failure(error))
            }
            
            if error != nil {
                let error = APIError(localizedDescription: ErrorConstants.communicationError.rawValue)
                completion(Result.failure(error))
                return
            }
            
        }
    }
    
    
    func saveToken(_ loginRequest: LoginRequest) {
        let token = FakeToken(email: loginRequest.email, password: loginRequest.password)
        do {
            let data = try JSONEncoder().encode(token)
            UserDefaults.standard.setValue(data, forKey: UserDefaultKeys.token.rawValue)
        } catch {
            print("error encoding the token")
        }
    }
    
}
