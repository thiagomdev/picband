//
//  ViewController.swift
//  PicBand
//
//  Created by Thiago Monteiro  on 6/24/21.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - Properties
    var loginScreen: LoginScreen?
    
    
    // MARK: - Super Methods
    override func loadView() {
        self.loginScreen = LoginScreen()
        self.view = self.loginScreen
        self.loginScreen?.delegate = self
        self.loginScreen?.delegate = self
        self.loginScreen?.configTextFieldDelegate(delegate: self)
        self.loginScreen?.loginButton.isEnabled = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    
    func validateTextField() {
        let password: String = self.loginScreen?.textFieldPassword.text ?? ""
        let email: String = self.loginScreen?.textFieldEmail.text ?? ""
        
        if !password.isEmpty && !email.isEmpty {
            self.loginScreen?.loginButton.setTitleColor(.white, for: .normal)
            self.loginScreen?.loginButton.isEnabled = true
            
        } else {
            self.loginScreen?.loginButton.isEnabled = false
        }
    }
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        textField.layer.borderColor = UIColor.green.cgColor
        textField.layer.borderWidth = 0.5
        
        self.loginScreen?.loginButton.setTitleColor(.lightGray, for: .normal)
        self.loginScreen?.loginButton.isEnabled = false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        switch textField {
        
        case self.loginScreen?.textFieldEmail:
            self.loginScreen?.emailIsEmpty()
        case self.loginScreen?.textFieldPassword:
            self.loginScreen?.passwordIsEmpty()
            self.validateTextField()
        default:break
            
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

extension LoginViewController: LoginScreenDelegate {
    func loginButton() {
        let login = CategoriesViewController()
        self.navigationController?.pushViewController(login, animated: true)
    }
    
    func registerButton() {
        let register = RegisterViewController()
        self.present(register, animated: true, completion: nil)
    }
    
}

