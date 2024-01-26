//
//  EmployeeTableViewCell.swift
//  CRUD_List
//
//  Created by intekglobal02 on 1/24/24.
//

import UIKit

class EmployeeTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var roleLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        photoImageView.round()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func config(with employee: Employee) {
        nameLabel.text = employee.name
        roleLabel.text = employee.role
        
        if let data = employee.photo {
            photoImageView.image = UIImage(data: data)
        }
    }
    
    

}
