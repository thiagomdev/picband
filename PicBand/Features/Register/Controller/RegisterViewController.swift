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

extension RegisterViewController: RegisterScreenDelegate {
    
    func registerButton() {
        self.auth?.createUser(withEmail: self.registerScreen?.textFieldEmail.text ?? "", password: self.registerScreen?.textFieldPassword.text ?? "", completion: { result, error in
            
            let alert = UIAlertController(title: "Alert!", message: "Usuário Existente.", preferredStyle: .alert)
            
            let action = UIAlertAction(title: "Fechar", style: .default) {
                (action) in
            }
            
            let alert2 = UIAlertController(title: "Success", message: "Cadastro realizado com Sucesso.", preferredStyle: .alert)
            
            let actionSucess = UIAlertAction(title: "Fechar!", style: .default) {
                (action) in
            }
            
            alert.addAction(action)
            alert2.addAction(actionSucess)
            
            if error != nil {
                print("Usuário existente.")
                self.present(alert, animated: true, completion: nil)
                
            } else {
                print("Cadastro realizado com Sucesso.")
                self.present(alert2, animated: true, completion: nil)
                self.dismiss(animated: true, completion: nil)
            }
        })
    }
}


