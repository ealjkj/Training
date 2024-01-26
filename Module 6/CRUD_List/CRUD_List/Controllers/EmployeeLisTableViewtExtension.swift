//
//  EmployeeLisTableViewtExtension.swift
//  CRUD_List
//
//  Created by intekglobal02 on 1/24/24.
//

import UIKit

extension EmployeeListViewController : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employees.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: IdentifierConstants.Reuse.employeeTableViewCell, for: indexPath) as! EmployeeTableViewCell
        
        let employee = employees[indexPath.row]
        cell.config(with: employee)
        
        
        return cell
    }
}


extension EmployeeListViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { _, _, completionHandler in
            let employee = self.employees[indexPath.row]
            self.employeeManager.deleteEmployee(employee: employee)
            self.updateData()
            self.updateUI()
        }
        
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [deleteAction])
        swipeConfiguration.performsFirstActionWithFullSwipe = false
        return swipeConfiguration
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: ControllerConstants.detaillVC) as? EmployeeDetailsViewController {
            vc.employee = employees[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        } else {
            print("no view controller")
        }
        
    }
}
