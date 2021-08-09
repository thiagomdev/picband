//
//  ExtensionLoginViewController.swift
//  ExtensionLoginViewController
//
//  Created by Thiago Monteiro on 08/08/21.
//

import UIKit
import Firebase

extension LoginViewController: LoginScreenDelegate {
    func loginButton() {
        
        guard let user = self.loginScreen else { return }
        
        let alert2 = UIAlertController(title: "Alert!", message: "Você ainda não possui cadastro, Efetue um cadastro.", preferredStyle: .alert)
        
        let action1 = UIAlertAction(title: "Fechar", style: .default) {
            (action) in
        }
        
        alert2.addAction(action1)
        
        
        self.auth?.signIn(withEmail: user.getEmail(), password: user.getPassword(), completion: { (result, error) in
            
            if error != nil {
                self.present(alert2, animated: true, completion: nil)
                self.loginScreen?.textFieldEmail.text = ""
                self.loginScreen?.textFieldPassword.text = ""
                
            } else {
                print("Login Efetuado.")
                self.loginScreen?.textFieldEmail.text = ""
                self.loginScreen?.textFieldPassword.text = ""
                let login = CategoriesViewController()
                self.navigationController?.pushViewController(login, animated: true)
                
              
            }
        })
    }
    
    func registerButton() {
        let register = RegisterViewController()
        self.present(register, animated: true, completion: nil)
    }
}
