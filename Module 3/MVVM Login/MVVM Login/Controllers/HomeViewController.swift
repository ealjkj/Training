//
//  HomeViewController.swift
//  MVVM Login
//
//  Created by intekglobal02 on 1/18/24.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = ScreenTitles.home.rawValue
        navigationItem.hidesBackButton = true

        // Do any additional setup after loading the view.
    }
    @IBAction func logoutBtnTapped(_ sender: UIButton) {
        UserDefaults.standard.removeObject(forKey: UserDefaultKeys.token.rawValue)
        navigationController?.popToRootViewController(animated: true)
    }
    
}


