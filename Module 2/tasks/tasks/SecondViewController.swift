//
//  SecondViewController.swift
//  tasks
//
//  Created by intekglobal02 on 1/17/24.
//

import UIKit

protocol SecondViewControllerDelegate {
    func updateUI() -> Void
}

class SecondViewController: UIViewController {

    @IBOutlet weak var taskDescriptionTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    
    var task: Task?
    var delegate: SecondViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
    }
    
    func config() {
        guard let task = task else {return}
        self.title = "Task"
        firstNameTextField.text = task.firstName
        lastNameTextField.text = task.lastName
        emailTextField.text = task.email
        taskDescriptionTextField.text = task.description
    }
    
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        guard let task = task else {return}

        if let firstName = firstNameTextField.text,
        let lastName = lastNameTextField.text,
        let email = emailTextField.text,
        let taskDescription = taskDescriptionTextField.text {
            TaskList.shared.update(task: task, newValue: Task(firstName: firstName, lastName: lastName, email: email, description: taskDescription))
            delegate?.updateUI()
            navigationController?.popViewController(animated: true)
        }
    }
    
}
