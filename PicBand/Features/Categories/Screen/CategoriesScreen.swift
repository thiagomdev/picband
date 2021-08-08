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
        
        // MARK: - Constraints Stack View Musician
        stackViewCustom
            .topToSuperview(60, toSafeArea: true)
            .centerHorizontal(to: self)
            .leadingToLeading(of: self, margin: 30)
            .trailingToTrailing(of: self, margin: 30)
            .heightTo(200)
        
        
        // MARK: - Constraints Stack View Bands
        stackViewCustomBands
            .topToBottom(of: stackViewCustom, margin: 30)
            .centerHorizontal(to: self)
            .leadingToLeading(of: self, margin: 30)
            .trailingToTrailing(of: self, margin: 30)
            .heightTo(200)
        
        
        // MARK: - constraints Label Title
        labelTitle
            .topToTop(of: stackViewCustom, margin: 30)
            .centerHorizontal(to: self)
        
        
        // MARK: - Constraints Label Subtitle
        labelSubtitle
            .topToTop(of: labelTitle, margin: 38)
            .centerHorizontal(to: self)
            .leadingToLeading(of: self, margin: 40)
            .trailingToTrailing(of: self, margin: 40)
        
    
        // MARK: - Constraints Musician Button
        pickMusicianButton
            .centerHorizontal(to: self)
            .topToBottom(of: labelSubtitle, margin: 20)
        
        
        // MARK: - constraints Label Title
        labelTitleBand
            .topToTop(of: stackViewCustomBands, margin: 30)
            .centerHorizontal(to: self)
        
    
        // MARK: - Constraints Label Subtitle
        labelSubtitleBand
            .centerHorizontal(to: self)
            .topToTop(of: labelTitleBand, margin: 38)
            .leadingToLeading(of: self, margin: 40)
            .trailingToTrailing(of: self, margin: 40)
        
        
        // MARK: - Constraints Band Button
        pickBandButton
            .centerHorizontal(to: self)
            .topToBottom(of: labelSubtitleBand, margin: 20)
        
        // MARK: - Constraints Back Button
        backButton
            .topToSuperview(20, toSafeArea: true)
            .leadingToLeading(of: self, margin: 20)
        
        
        // MARK: - Constraints About Us Pick Band
        labelAboutPickBand
            .trailingToTrailing(of: self, margin: 20)
            .bottomToBottom(of: self, margin: 32)
            .leadingToLeading(of: self, margin: 20)
            .trailingToTrailing(of: self, margin: 20)
  
    }
    
    func extraSetupConfiguration() {
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
