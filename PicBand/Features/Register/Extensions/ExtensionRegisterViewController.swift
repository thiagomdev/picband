//
//  ExtensionRegisterViewController.swift
//  ExtensionRegisterViewController
//
//  Created by Thiago Monteiro on 08/08/21.
//

import UIKit
import Firebase

extension RegisterViewController: RegisterScreenDelegate {
    func registerButton() {
        
        guard let register = self.registerScreen else { return }
        
        self.auth?.createUser(withEmail: register.getEmail(), password: register.getPassword(), completion: { result, error in
            
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
                self.registerScreen?.textFieldEmail.text = ""
                self.registerScreen?.textFieldPassword.text = ""
                self.dismiss(animated: true, completion: nil)
            }
        })
    }
}
