//
//  RegisterScreen.swift
//  PicBand
//
//  Created by Thiago Monteiro  on 6/24/21.
//

import UIKit

protocol RegisterScreenDelegate: AnyObject {
    func registerButton()
    
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
        tfEmail.keyboardType = .default
        tfEmail.borderStyle = .roundedRect
        return tfEmail
    }()
    
    lazy var textFieldPassword: UITextField = {
        let tfPassword = UITextField()
        tfPassword.translatesAutoresizingMaskIntoConstraints = false
        tfPassword.placeholder = "Password"
        tfPassword.textAlignment = .center
        tfPassword.font = UIFont.systemFont(ofSize: 14)
        tfPassword.keyboardType = .default
        tfPassword.borderStyle = .roundedRect
        return tfPassword
    }()
//
//    lazy var textFieldConfirmPassword: UITextField = {
//        let tfConfiPassword = UITextField()
//        tfConfiPassword.translatesAutoresizingMaskIntoConstraints = false
//        tfConfiPassword.placeholder = "Confirm Password"
//        tfConfiPassword.textAlignment = .center
//        tfConfiPassword.font = UIFont.systemFont(ofSize: 14)
//        tfConfiPassword.keyboardType = .default
//        tfConfiPassword.borderStyle = .roundedRect
//        return tfConfiPassword
//    }()
    
    lazy var registerButton: UIButton = {
        let register = UIButton()
        register.translatesAutoresizingMaskIntoConstraints = false
        register.setTitle("Register", for: .normal)
        register.setTitleColor(.white, for: .normal)
        register.backgroundColor = .clear
        register.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        register.layer.cornerRadius = 7.5
        register.clipsToBounds = true
        register.addTarget(self, action: #selector(registerDismiss), for: .touchUpInside)
        return register
    }()
    
    @objc func registerDismiss() {
        self.delegate?.registerButton()
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
//        self.addSubview(textFieldConfirmPassword)
        self.addSubview(registerButton)
        self.addSubview(logoImageView)
        
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
        
        
        // MARK: - Constraint Text Field Confirm Password
//        textFieldConfirmPassword
//            .topToBottom(of: textFieldPassword, margin: Constant.margin)
//            .leadingToSuperview(Constant.leading, toSafeArea: true)
//            .trailingToSuperview(Constant.trailing, toSafeArea: true)
//
//
        // MARK: - Constraints Register Button
        registerButton
            .topToBottom(of: textFieldPassword, margin: Constant.margin)
            .centerHorizontal(to: textFieldPassword)
        
        
        // MARK: - Constraints Logo Image View
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
