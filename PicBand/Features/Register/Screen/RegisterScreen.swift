//
//  RegisterScreen.swift
//  PicBand
//
//  Created by Thiago Monteiro  on 6/24/21.
//

import UIKit

protocol RegisterScreenDelegate: AnyObject {
    func dismiss()
}
class RegisterScreen: UIView, CodeView {

    // MARK: - Properties
    weak var delegate: RegisterScreenDelegate?
    
    
    // MARK: - Elements
    lazy var bgImage: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(imageLiteralResourceName: "img")
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        return img
    }()
    
    
    lazy var logoImageView: UIImageView = {
        let imgLogo = UIImageView()
        imgLogo.translatesAutoresizingMaskIntoConstraints = false
        imgLogo.image = UIImage(systemName: "tv.music.note")
        imgLogo.contentMode = .scaleAspectFit
        imgLogo.backgroundColor = .white
        imgLogo.layer.cornerRadius = 7.5
        imgLogo.tintColor = .black
        imgLogo.alpha = 0.6
        imgLogo.clipsToBounds = true
        return imgLogo
    }()
    
    lazy var textFieldEmail: UITextField = {
        let tfEmail = UITextField()
        tfEmail.translatesAutoresizingMaskIntoConstraints = false
        tfEmail.placeholder = "Email"
        tfEmail.textAlignment = .center
        tfEmail.font = UIFont.systemFont(ofSize: 14)
        tfEmail.keyboardType = .numberPad
        tfEmail.borderStyle = .roundedRect
        return tfEmail
    }()
    
    
    lazy var textFieldPassword: UITextField = {
        let tfPassword = UITextField()
        tfPassword.translatesAutoresizingMaskIntoConstraints = false
        tfPassword.placeholder = "Password"
        tfPassword.textAlignment = .center
        tfPassword.font = UIFont.systemFont(ofSize: 14)
        tfPassword.keyboardType = .numberPad
        tfPassword.borderStyle = .roundedRect
        return tfPassword
    }()
    
    lazy var textFieldConfirmPassword: UITextField = {
        let tfConfiPassword = UITextField()
        tfConfiPassword.translatesAutoresizingMaskIntoConstraints = false
        tfConfiPassword.placeholder = "Confirm Password"
        tfConfiPassword.textAlignment = .center
        tfConfiPassword.font = UIFont.systemFont(ofSize: 14)
        tfConfiPassword.keyboardType = .numberPad
        tfConfiPassword.borderStyle = .roundedRect
        return tfConfiPassword
    }()
    
    
    lazy var registerButton: UIButton = {
        let register = UIButton()
        register.translatesAutoresizingMaskIntoConstraints = false
        register.setTitle("Sign up", for: .normal)
        register.setTitleColor(.white, for: .normal)
        register.backgroundColor = .clear
        register.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        register.layer.cornerRadius = 7.5
        register.clipsToBounds = true
        register.addTarget(self, action: #selector(registerDismiss), for: .touchUpInside)
        return register
    }()
    
    @objc func registerDismiss() {
        self.delegate?.dismiss()
    }
    
    
    // MARK: - Super Methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    // MARK: - Methods
    func buildViewHierarchy() {
        self.addSubview(bgImage)
        self.addSubview(textFieldEmail)
        self.addSubview(textFieldPassword)
        self.addSubview(textFieldConfirmPassword)
        self.addSubview(registerButton)
        self.addSubview(logoImageView)
        
    }
    
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
        
            // MARK: - Constraints Text Field Email
            self.textFieldEmail.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -50),
            self.textFieldEmail.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 24),
            self.textFieldEmail.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: -24),
            
            // MARK: - Constraints Text Field Password
            self.textFieldPassword.topAnchor.constraint(equalTo: self.textFieldEmail.bottomAnchor, constant: 6),
            self.textFieldPassword.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 24),
            self.textFieldPassword.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: -24),
            
            // MARK: - Constraint Text Field Confirm Password
            self.textFieldConfirmPassword.topAnchor.constraint(equalTo: self.textFieldPassword.bottomAnchor, constant: 6),
            self.textFieldConfirmPassword.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 24),
            self.textFieldConfirmPassword.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: -24),
            
            // MARK: - Constraints Register Button
            self.registerButton.topAnchor.constraint(equalTo: self.textFieldConfirmPassword.bottomAnchor),
            self.registerButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            self.logoImageView.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            self.logoImageView.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor, constant: -140),
            self.logoImageView.heightAnchor.constraint(equalToConstant: 100),
            self.logoImageView.widthAnchor.constraint(equalToConstant: 100),
            
            // MARK: - Constraints Image Background
            self.bgImage.topAnchor.constraint(equalTo: self.topAnchor),
            self.bgImage.leftAnchor.constraint(equalTo: self.leftAnchor),
            self.bgImage.rightAnchor.constraint(equalTo: self.rightAnchor),
            self.bgImage.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
        ])
    }
    
    
    func extraSetupConfiguration() {
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
