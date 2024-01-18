//
//  TaskTableViewCell.swift
//  tasks
//
//  Created by intekglobal02 on 1/17/24.
//

import UIKit

class TaskTableViewCell: UITableViewCell {
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var taskDescriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func config(task: Task) {
        fullNameLabel.text = "\(task.firstName) \(task.lastName)"
        emailLabel.text = task.email
        taskDescriptionLabel.text = task.description
    }
    
}
