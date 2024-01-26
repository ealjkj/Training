//
//  UIImageView+Extension.swift
//  CRUD_List
//
//  Created by intekglobal02 on 1/26/24.
//

import Foundation
import UIKit

extension UIImageView {
    
    func round() {
        self.layer.cornerRadius = self.frame.size.height / 1.8
        clipsToBounds = true
    }
}
