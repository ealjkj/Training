//
//  ViewController.swift
//  MVVM Login
//
//  Created by intekglobal02 on 1/18/24.
//

import UIKit

class RegisterViewController: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordConfirmationTextField: UITextField!
    
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var registerButton: UIButton!
    
    let registrationService = RegistrationService(httpUtility: HttpUtility())
    let registrationValidation = RegistrationValidation()
    
    lazy var registrationViewModel: RegistrationViewModel = {
        let viewModel = RegistrationViewModel(registrationService: self.registrationService, registrationValidation: self.registrationValidation)
        viewModel.registrationDelegate = self
        return viewModel
    }()
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = ScreenTitles.register.rawValue
        
        nameTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
        passwordConfirmationTextField.delegate = self
        
    }
    
    @IBAction func registerBtnTapped(_ sender: UIButton) {
        // API call
        
        
        registrationViewModel.signup()
        
//        performSegue(withIdentifier: SegueConstants.registerToLogin.rawValue, sender: self)
    }
}

// MARK: - TextField Delegate

extension RegisterViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        
        if let name = nameTextField.text,
           let email =  emailTextField.text,
           let password = passwordTextField.text,
           let passwordConfirmation =  passwordConfirmationTextField.text{
            
            let registrationRequest = RegistrationRequest(name: name, email: email, password: password, passwordConfirmation: passwordConfirmation)
            registrationViewModel.registrationRequest = registrationRequest
        }
    }
}



// MARK: - RegistrationViewModel Delegate

extension RegisterViewController: RegistrationViewModelDelegate {
    func apiResponseStatus(isSuccessful: Bool, registrationResponse: RegistrationResponse?, error: APIError?) {
        
        
        
        if isSuccessful {
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: SegueConstants.registerToLogin.rawValue, sender: self)
            }
        } else {
            DispatchQueue.main.async {
                self.errorLabel.text = error?.localizedDescription
                self.errorLabel.isHidden = false
            }

        }
    }
    
    func validationResult(result: ValidationResult) {
        DispatchQueue.main.async {
            self.registerButton.isUserInteractionEnabled = result.success
            self.registerButton.layer.opacity = result.success ? 1 : 0.4
            
            self.errorLabel.text = result.errorMessage
            self.errorLabel.isHidden = result.success
        }
    
    }
    
}
