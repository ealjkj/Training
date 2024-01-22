//
//  RegistrationViewModel.swift
//  MVVM Login
//
//  Created by intekglobal02 on 1/18/24.
//

import Foundation

protocol LoginViewModelDelegate : AnyObject {
    func apiResponseStatus(isSuccessful: Bool, user: User?, error: APIError?)
}

class LoginViewModel : ObservableObject {
    private let loginService: LoginService
    weak var loginDelegate: LoginViewModelDelegate?
    
    @Published var loginRequest: LoginRequest?
    
    init(loginService: LoginService) {
        self.loginService = loginService
    }
    
    
    func login() {
        loginService.loginRequest = loginRequest
        loginService.login() { data in
            switch data {
            case .success(let response):
                self.loginDelegate?.apiResponseStatus(isSuccessful: true, user: response, error: nil)
                
            case .failure(let error):
                self.loginDelegate?.apiResponseStatus(isSuccessful: false, user: nil, error: error)
            }
        }
    }
    
    func tryToLoginWithToken() {
        if let data = UserDefaults.standard.data(forKey: UserDefaultKeys.token.rawValue) {
            do  {
                let token = try JSONDecoder().decode(FakeToken.self, from: data)
                self.loginRequest = LoginRequest(email: token.email, password: token.password)
                self.login()
            } catch {
                print("error decoding the token")
            }
            
            
        }
    }
}
