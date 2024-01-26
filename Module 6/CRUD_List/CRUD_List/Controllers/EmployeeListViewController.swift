//
//  ViewController.swift
//  CRUD_List
//
//  Created by intekglobal02 on 1/24/24.
//

import UIKit

class EmployeeListViewController: UIViewController {

    
    @IBOutlet weak var employeeTableView: UITableView!
    let employeeManager = EmployeeManager()
    var employees = [Employee]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initiateVC()
    }
    
    func initiateVC() {
        employeeTableView.delegate = self
        employeeTableView.dataSource = self
        employeeTableView.register(
            UINib(nibName: IdentifierConstants.Nib.employeeTableViewCell, bundle: nil),
            forCellReuseIdentifier: IdentifierConstants.Reuse.employeeTableViewCell
        )
        
        navigationItem.title = "Employees"
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        updateData()
        updateUI()
    }
    
    func updateUI() {
        employeeTableView.reloadData()
    }
    
    func updateData() {
        employees = employeeManager.getAllEmployees() ?? employees
    }
}

