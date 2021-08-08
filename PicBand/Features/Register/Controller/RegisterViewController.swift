//
//  RegisterViewController.swift
//  PicBand
//
//  Created by Thiago Monteiro  on 6/24/21.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {
    
    // MARK: - Properties
    var registerScreen: RegisterScreen?
    var auth: Auth?
    
    // MARK: - Super Methods
    override func loadView() {
        self.registerScreen = RegisterScreen()
        self.view = self.registerScreen
        self.registerScreen?.delegate = self
        self.view.backgroundColor = .lightGray
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.auth = Auth.auth()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.navigationController?.navigationBar.prefersLargeTitles = false
    }
}



