//
//  CreateEmployeeViewController.swift
//  CRUD_List
//
//  Created by intekglobal02 on 1/24/24.
//

import UIKit

class CreateEmployeeViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    lazy var employeeManager = EmployeeManager()
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var roleTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        photoImageView.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(uploadPhoto(_:)))
        photoImageView.addGestureRecognizer(tapGesture)
        
    }
    
    @IBAction func createEmployeeTapped(_ sender: UIButton) {
    
        
        guard let name = nameTextField.text else {return}
        guard let role = roleTextField.text else {return}
        
        let newEmployee = Employee(name: name, role: role, photo: photoImageView.image?.pngData())
        employeeManager.createEmployee(employee: newEmployee)
        navigationController?.popViewController(animated: true)
    }
    
    
    @objc func uploadPhoto(_ sender: UITapGestureRecognizer) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .savedPhotosAlbum
        present(picker, animated: true)
    }
    
    
    
    // MARK: - UIPicker Delegate
     
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let image = info[.originalImage] as? UIImage
        photoImageView.image = image
        dismiss(animated: true)

    }

    

}
