//
//  EmployeeDetailsViewController.swift
//  CRUD_List
//
//  Created by intekglobal02 on 1/24/24.
//

import UIKit

class EmployeeDetailsViewController: UIViewController {

    @IBOutlet weak var roleTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var photoImageView: UIImageView!
    var employee: Employee?
    let employeeManager = EmployeeManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let employee = employee {
            config(with: employee)
        }
        
    }
    
    
    func config(with employee: Employee) {
        nameTextField.text = employee.name
        roleTextField.text = employee.role
        
        
        if let data = employee.photo {
            if let image = UIImage(data: data) {
                photoImageView.image = image
            }
        }
    }
    
    @IBAction func updateButtonTapped(_ sender: UIButton) {
        guard let employee = employee else { return }
        guard let newName = nameTextField.text else {return}
        guard let newRole = roleTextField.text else {return}
        let newPhoto = photoImageView.image?.pngData()

        
        let newEmployee = Employee(id: employee.id, name: newName, role: newRole, photo: newPhoto)
        if employeeManager.updateEmployee(employee: newEmployee) {
            navigationController?.popViewController(animated: true)
        } else {
            print("Could not update employee")
        }
    }

}
