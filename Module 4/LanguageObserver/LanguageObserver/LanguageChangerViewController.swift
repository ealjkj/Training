//
//  LanguageChangerViewController.swift
//  LanguageObserver
//
//  Created by intekglobal02 on 1/22/24.
//

import UIKit

class LanguageChangerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func changeLanguageTapped(_ sender: UIButton) {
        switch LanguageManager.shared.selectedLanguage {
            case "en":
                LanguageManager.shared.selectedLanguage = "hi"
            default:
                LanguageManager.shared.selectedLanguage = "en"
        }
    }
}
