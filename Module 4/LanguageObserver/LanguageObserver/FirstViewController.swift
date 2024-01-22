//
//  ViewController.swift
//  LanguageObserver
//
//  Created by intekglobal02 on 1/22/24.
//

import UIKit

class FirstViewController: UIViewController, LanguageObserver{
    enum Titles: String {
        case name = "this is the name label"
        
        var raw: String {
            return self.rawValue.localized()
        }
    }
    
    lazy var nameLabel : UILabel = {
        let label = UILabel(frame: CGRect(x: 10, y: view.center.y, width: 300, height: 100))
        label.text = Titles.name.raw
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(nameLabel)
        LanguageManager.shared.attach(self)
    }
    
    func languageDidChange(language: String) {
        nameLabel.text = Titles.name.raw
    }


}

