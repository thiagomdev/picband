//
//  LoginScreen.swift
//  PicBand
//
//  Created by Thiago Monteiro  on 6/24/21.
//

import UIKit

protocol LoginScreenDelegate: AnyObject {
    func loginButton()
    func registerButton()
}


class LoginScreen: UIView, CodeView {
    
    // MARK: - Properties
    weak var delegate: LoginScreenDelegate?
    
    
    // MARK: - Elements
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
    
    lazy var bgImage: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(imageLiteralResourceName: "img")
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        return img
    }()
    
    lazy var textFieldEmail: UITextField = {
        let tfEmail = UITextField()
        tfEmail.translatesAutoresizingMaskIntoConstraints = false
        tfEmail.placeholder = "E-mail"
        tfEmail.textAlignment = .center
        tfEmail.font = UIFont.systemFont(ofSize: 14)
        tfEmail.keyboardType = .default
        tfEmail.borderStyle = .roundedRect
        tfEmail.returnKeyType = .next
        tfEmail.clearButtonMode = .whileEditing
        tfEmail.autocorrectionType = .no
        return tfEmail
    }()
    
    lazy var textFieldPassword: UITextField = {
        let tfPassword = UITextField()
        tfPassword.translatesAutoresizingMaskIntoConstraints = false
        tfPassword.placeholder = "Password"
        tfPassword.textAlignment = .center
        tfPassword.font = UIFont.systemFont(ofSize: 14)
        tfPassword.keyboardType = .default
        tfPassword.isSecureTextEntry = true
        tfPassword.borderStyle = .roundedRect
        tfPassword.returnKeyType = .done
        tfPassword.clearButtonMode = .unlessEditing
        tfPassword.autocorrectionType = .no
        return tfPassword
    }()
    
    lazy var loginButton: UIButton = {
        let lgButton = UIButton()
        lgButton.translatesAutoresizingMaskIntoConstraints = false
        lgButton.setTitle("Sign In", for: .normal)
        lgButton.setTitleColor(.lightGray, for: .normal)
        lgButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        lgButton.layer.cornerRadius = 7.5
        lgButton.clipsToBounds = true
        lgButton.addTarget(self, action: #selector(tappedLogin), for: .touchUpInside)
        return lgButton
    }()
    
    @objc func tappedLogin() {
        self.delegate?.loginButton()
    }
    
    lazy var registerButton: UIButton = {
        let registerButton = UIButton()
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        registerButton.setTitle("Ready for Register?", for: .normal)
        registerButton.setTitleColor(.systemIndigo, for: .normal)
        registerButton.titleLabel?.font = UIFont.systemFont(ofSize: 10)
        registerButton.layer.cornerRadius = 7.5
        registerButton.clipsToBounds = true
        registerButton.layer.shadowOpacity = .greatestFiniteMagnitude
        registerButton.addTarget(self, action: #selector(tappedRegister), for: .touchUpInside)
        return registerButton
    }()
    
    @objc func tappedRegister() {
        self.delegate?.registerButton()
    }
    
    public func configTextFieldDelegate(delegate: UITextFieldDelegate) {
        self.textFieldPassword.delegate = delegate
        self.textFieldEmail.delegate = delegate
    }
    
    // MARK: - Super Methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemPink
        self.setup()
    }
    
    public func passwordIsEmpty() {
        if self.textFieldPassword.text == "" {
            self.textFieldPassword.layer.borderColor = UIColor.red.cgColor
            
        } else {
            self.textFieldPassword.layer.borderColor = UIColor.lightText.cgColor
            self.textFieldPassword.borderStyle = .roundedRect
        }
    }
    
    public func emailIsEmpty() {
        if self.textFieldEmail.text == "" {
            self.textFieldEmail.layer.borderColor = UIColor.red.cgColor
            
        } else {
            self.textFieldEmail.layer.borderColor = UIColor.lightText.cgColor
            self.textFieldEmail.borderStyle = .roundedRect
        }
    }
    
    // MARK: - Methods
    func buildViewHierarchy() {
        
        // MARK: - New Sub Views
        self.addSubview(bgImage)
        self.addSubview(logoImageView)
        self.addSubview(textFieldEmail)
        self.addSubview(textFieldPassword)
        self.addSubview(loginButton)
        self.addSubview(registerButton)
    }
    

    func setupConstraints() {
        
        // MARK: - Constraints Text Field Email
        textFieldEmail
            .centerVertical(to: self, constant: Constant.verticalTextFielEmail)
            .leadingToSuperview(Constant.leading, toSafeArea: true)
            .trailingToSuperview(Constant.trailing, toSafeArea: true)
        
        
        // MARK: - Constraints Text Field Password
        textFieldPassword
            .topToBottom(of: textFieldEmail, margin: Constant.margin)
            .leadingToSuperview(Constant.leading, toSafeArea: true)
            .trailingToSuperview(Constant.trailing, toSafeArea: true)
        
        
        // MARK: - Constraints Login Button
        loginButton
            .topToBottom(of: textFieldPassword, margin: Constant.margin)
            .centerHorizontal(to: textFieldPassword)
        
        
        // MARK: - Constraints Logo Image View
        registerButton
            .topToBottom(of: loginButton, margin: Constant.registerButtonMargin)
            .centerHorizontal(to: loginButton)
        
        
        // MARK: - Constraints Image Background
        logoImageView
            .centerHorizontal(to: self)
            .centerVertical(to: self, constant: Constant.centerVerticalLogoImageView)
            .heightTo(Constant.heigth)
            .widthTo(Constant.width)
        
        
        // MARK: - Constraints Image Background
        bgImage
            .topToTop(of: self)
            .leadingToLeading(of: self)
            .trailingToTrailing(of: self)
            .bottomToBottom(of: self)
    }
    
    func extraSetupConfiguration() {
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
