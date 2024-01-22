//
//  LoginViewController.swift
//  MVVM Login
//
//  Created by intekglobal02 on 1/18/24.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var errorLabel: UILabel!
    let loginService = LoginService(httpUtility: HttpUtility())
    lazy var loginViewModel: LoginViewModel = {
        let viewModel = LoginViewModel(loginService: self.loginService)
        viewModel.loginDelegate = self
        return viewModel
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = ScreenTitles.login.rawValue

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginBtnTapped(_ sender: UIButton) {
        guard let email = emailTextField.text, let password = passwordTextField.text else {return}
        loginViewModel.loginRequest = LoginRequest(email: email, password: password)
        loginViewModel.login()
    }
}

// MARK: - Login Delegate

extension LoginViewController: LoginViewModelDelegate {
    func apiResponseStatus(isSuccessful: Bool, user: User?, error: APIError?) {
        DispatchQueue.main.async {
            if isSuccessful {
                self.performSegue(withIdentifier: SegueConstants.loginToHome.rawValue, sender: self)
            }
            
            else {
                self.errorLabel.text = error?.localizedDescription
            }
        }
    }
}
