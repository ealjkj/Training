//
//  ViewController.swift
//  tasks
//
//  Created by intekglobal02 on 1/17/24.
//

import UIKit

enum StoryBoards: String {
    case Main = "Main"
}

enum Controllers: String {
    case secondViewController = "SecondViewController"
}

class ViewController: UIViewController, SecondViewControllerDelegate {

    @IBOutlet weak var taskTableView: UITableView!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var taskDescriptionTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "List of Tasks"
        taskTableView.dataSource = self
        taskTableView.delegate = self
        taskTableView.register(UINib(nibName: "TaskTableViewCell", bundle: nil), forCellReuseIdentifier: "TaskTableViewCell")
        emailTextField.delegate = self
    }
    
    @IBAction func addTaskButton(_ sender: UIButton) {
        if let firstName = firstNameTextField.text, 
            let lastName = lastNameTextField.text,
            let email = emailTextField.text, 
            let taskDescription = taskDescriptionTextField.text {
            
            TaskList.shared.tasks.append(Task(firstName: firstName, lastName: lastName , email: email , description: taskDescription))
            
            updateUI()
        }
    }
    
    func updateUI() {
        taskTableView.reloadData()
    }
    

}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: StoryBoards.Main.rawValue, bundle: nil)
        
        if let vc = storyboard.instantiateViewController(withIdentifier: Controllers.secondViewController.rawValue) as? SecondViewController {
            let task = TaskList.shared.tasks[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
            vc.task = task
            vc.delegate = self
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { _, _, completion in
            
            let alert = UIAlertController(title: "Delete Task", message: "Are you sure you want to delete this element", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { _ in
                TaskList.shared.remove(at: indexPath.row)
                self.updateUI()
            }))
            
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { _ in }))
            
            
            self.present(alert, animated: true)
            completion(true)
        }
        
        deleteAction.image = UIImage(systemName: "trash")
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        return configuration
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        TaskList.shared.tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskTableViewCell", for: indexPath) as! TaskTableViewCell
        let task = TaskList.shared.tasks[indexPath.row]
        cell.config(task: task)
        return cell
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField)     {
        if let email = textField.text  {
            if(!Validator().validateEmail(email)) {
                textField.textColor = .red
            } else {
                textField.textColor = .label
            }
        }
        
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if let email = textField.text  {
            if(Validator().validateEmail(email)) {
                textField.textColor = .label
            }
        }
    }
}
