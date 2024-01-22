//
//  FlowDeciderViewController.swift
//  MVVM Login
//
//  Created by intekglobal02 on 1/22/24.
//

import UIKit

class FlowDeciderViewController: UIViewController {

    let loginService = LoginService(httpUtility: HttpUtility())
    
    lazy var loginViewModel: LoginViewModel = {
        let viewModel = LoginViewModel(loginService: self.loginService)
        viewModel.loginDelegate = self
        return viewModel
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginViewModel.tryToLoginWithToken()
    }
    

}

// MARK: - Login delegate

extension FlowDeciderViewController : LoginViewModelDelegate {
    func apiResponseStatus(isSuccessful: Bool, user: User?, error: APIError?) {
        if isSuccessful {
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: SegueConstants.flowToHome.rawValue, sender: self)
            }
        }
    }
}
