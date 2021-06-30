//
//  CategoriesScreen.swift
//  PicBand
//
//  Created by Thiago Monteiro  on 6/26/21.
//

import UIKit

protocol CategoriesScreenDelegate: AnyObject {
    func enterMusician()
    func enterBands()
    func backButton()
}


class CategoriesScreen: UIView, CodeView {
    
    // MARK: - Properties
    weak var delegate: CategoriesScreenDelegate?
    
    // MARK: - Elements
    lazy var stackViewCustom: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 10
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.backgroundColor = .white
        stack.layer.cornerRadius = 7.5
        stack.layer.shadowOpacity = .greatestFiniteMagnitude
        return stack
    }()
    
    lazy var stackViewCustomBands: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 10
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.backgroundColor = .white
        stack.layer.cornerRadius = 7.5
        stack.layer.shadowOpacity = .greatestFiniteMagnitude
        return stack
    }()
    
    lazy var labelTitle: UILabel = {
        let lbTitle = UILabel()
        lbTitle.translatesAutoresizingMaskIntoConstraints = false
        lbTitle.text = "PICK YOUR MUSICIAN"
        lbTitle.textAlignment = .center
        lbTitle.tintColor = .black
        lbTitle.numberOfLines = 0
        lbTitle.font = UIFont.boldSystemFont(ofSize: 16)
        return lbTitle
    }()
    
    lazy var labelSubtitle: UILabel = {
        let lbSubtitle = UILabel()
        lbSubtitle.translatesAutoresizingMaskIntoConstraints = false
        lbSubtitle.text = "You can find here, a professional Musician to your best show! We're going to help you. Enjoy It."
        lbSubtitle.textAlignment = .center
        lbSubtitle.tintColor = .lightGray
        lbSubtitle.numberOfLines = 0
        lbSubtitle.font = UIFont.systemFont(ofSize: 12)
        return lbSubtitle
    }()
    
    lazy var labelTitleBand: UILabel = {
        let lbTitle = UILabel()
        lbTitle.translatesAutoresizingMaskIntoConstraints = false
        lbTitle.text = "PICK YOUR BAND"
        lbTitle.textAlignment = .center
        lbTitle.tintColor = .black
        lbTitle.numberOfLines = 0
        lbTitle.font = UIFont.boldSystemFont(ofSize: 16)
        return lbTitle
    }()
    
    lazy var labelSubtitleBand: UILabel = {
        let lbSubtitle = UILabel()
        lbSubtitle.translatesAutoresizingMaskIntoConstraints = false
        lbSubtitle.text = "You can find here, a professional Band to your best show! We're going to help you. Enjoy It."
        lbSubtitle.textAlignment = .center
        lbSubtitle.tintColor = .lightGray
        lbSubtitle.numberOfLines = 0
        lbSubtitle.font = UIFont.systemFont(ofSize: 12)
        return lbSubtitle
    }()
    
    lazy var labelAboutPickBand: UILabel = {
        let lbAbout = UILabel()
        lbAbout.translatesAutoresizingMaskIntoConstraints = false
        lbAbout.text = "About the Pick Band. We're here to help you with all decisions you want  to do. Chose the Best Musician or Band. Enjoy it."
        lbAbout.textAlignment = .center
        lbAbout.tintColor = .gray
        lbAbout.numberOfLines = 0
        lbAbout.font = UIFont.boldSystemFont(ofSize: 10)
        return lbAbout
    }()
    
    lazy var pickBandButton: UIButton = {
        let pickBand = UIButton()
        pickBand.translatesAutoresizingMaskIntoConstraints = false
        pickBand.setTitle("Bands", for: .normal)
        pickBand.setTitleColor(.blue, for: .normal)
        pickBand.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        pickBand.layer.cornerRadius = 7.5
        pickBand.clipsToBounds = true
        pickBand.addTarget(self, action: #selector(pickProfessionalBand), for: .touchUpInside)
        return pickBand
    }()
    
    @objc func pickProfessionalBand() {
        self.delegate?.enterBands()
    }
    
    lazy var pickMusicianButton: UIButton = {
        let pickMusician = UIButton()
        pickMusician.translatesAutoresizingMaskIntoConstraints = false
        pickMusician.setTitle("Musician", for: .normal)
        pickMusician.setTitleColor(.blue, for: .normal)
        pickMusician.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        pickMusician.layer.cornerRadius = 7.5
        pickMusician.clipsToBounds = true
        pickMusician.addTarget(self, action: #selector(pickProfessionalMusician), for: .touchUpInside)
        return pickMusician
    }()
    
    @objc func pickProfessionalMusician() {
        self.delegate?.enterMusician()
    }
    
    lazy var backButton: UIButton = {
        let back = UIButton()
        back.translatesAutoresizingMaskIntoConstraints = false
        back.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        back.setTitleColor(.white, for: .normal)
        back.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        back.clipsToBounds = true
        back.addTarget(self, action: #selector(backToLogin), for: .touchUpInside)
        return back
    }()
    
    @objc func backToLogin() {
        self.delegate?.backButton()
    }
    // MARK: - Super Methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.setup()
    }
    
    
    // MARK: - Methods
    func buildViewHierarchy() {
        self.addSubview(stackViewCustom)
        self.addSubview(stackViewCustomBands)
        self.stackViewCustom.addSubview(labelTitle)
        self.stackViewCustom.addSubview(labelSubtitle)
        self.stackViewCustom.addSubview(pickMusicianButton)
        self.stackViewCustomBands.addSubview(labelTitleBand)
        self.stackViewCustomBands.addSubview(labelSubtitleBand)
        self.stackViewCustomBands.addSubview(pickBandButton)
        self.addSubview(backButton)
        self.addSubview(labelAboutPickBand)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            // MARK: - Constraints Stack View Musician
            self.stackViewCustom.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 60),
            self.stackViewCustom.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            self.stackViewCustom.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            self.stackViewCustom.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            self.stackViewCustom.heightAnchor.constraint(equalToConstant: 200),
            
            
            // MARK: - Constraints Stack View Bands
            self.stackViewCustomBands.topAnchor.constraint(equalTo: self.stackViewCustom.bottomAnchor, constant: 30),
            self.stackViewCustomBands.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            self.stackViewCustomBands.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            self.stackViewCustomBands.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            self.stackViewCustomBands.heightAnchor.constraint(equalToConstant: 200),
            
            // MARK: - constraints Label Title
            self.labelTitle.topAnchor.constraint(equalTo: self.stackViewCustom.topAnchor, constant: 30),
            self.labelTitle.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            // MARK: - Constraints Label Subtitle
            self.labelSubtitle.topAnchor.constraint(equalTo: self.labelTitle.topAnchor, constant: 38),
            self.labelSubtitle.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.labelSubtitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            self.labelSubtitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
            
            // MARK: - Constraints Musician Button
            self.pickMusicianButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.pickMusicianButton.topAnchor.constraint(equalTo: self.labelSubtitle.bottomAnchor, constant: 20),
            
            // MARK: - constraints Label Title
            self.labelTitleBand.topAnchor.constraint(equalTo: self.stackViewCustomBands.topAnchor, constant: 30),
            self.labelTitleBand.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            // MARK: - Constraints Label Subtitle
            self.labelSubtitleBand.topAnchor.constraint(equalTo: self.labelTitleBand.topAnchor, constant: 38),
            self.labelSubtitleBand.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.labelSubtitleBand.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            self.labelSubtitleBand.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
            
            // MARK: - Constraints Band Button
            self.pickBandButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.pickBandButton.topAnchor.constraint(equalTo: self.labelSubtitleBand.bottomAnchor, constant: 20),
            
            // MARK: - Constraints Back Button
            self.backButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            self.backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            
            // MARK: - Constraints About Us label
            self.labelAboutPickBand.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.labelAboutPickBand.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -32),
            self.labelAboutPickBand.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.labelAboutPickBand.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
            
        ])
    }
    
    func extraSetupConfiguration() {
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
