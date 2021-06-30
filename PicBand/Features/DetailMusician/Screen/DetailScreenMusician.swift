//
//  DetailMusicianScreen.swift
//  PicBand
//
//  Created by Thiago Monteiro  on 6/27/21.
//

import UIKit

class DetailScreenMusician: UIView, CodeView {
    
    // MARK: - Properties
    
    
    // MARK: - Elements
    let scrollViewcustom: UIScrollView = {
        let scrollView = UIScrollView(frame: .zero)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.keyboardDismissMode = .interactive
        scrollView.contentSize = CGSize(width: scrollView.frame.size.width, height: 1000)
        return scrollView
    }()
    
    lazy var stackViewCustomGreen: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 10
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.backgroundColor = .red
        return stack
    }()
    
    lazy var stackViewCustomOrange: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 10
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.backgroundColor = .blue
        return stack
    }()

    
    // MARK: - Super Methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.setup()
    }
    
    
    // MARK: - Methods
    func buildViewHierarchy() {
        self.addSubview(scrollViewcustom)
        self.scrollViewcustom.addSubview(stackViewCustomGreen)
        self.scrollViewcustom.addSubview(stackViewCustomOrange)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            // MARK: - Constraints Scroll View Custom
            self.scrollViewcustom.topAnchor.constraint(equalTo: self.topAnchor),
            self.scrollViewcustom.leftAnchor.constraint(equalTo: self.leftAnchor),
            self.scrollViewcustom.rightAnchor.constraint(equalTo: self.rightAnchor),
            self.scrollViewcustom.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            // MARK: - Constraints Green Stack View
            self.stackViewCustomGreen.topAnchor.constraint(equalTo: self.scrollViewcustom.topAnchor, constant: 30),
            self.stackViewCustomGreen.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.stackViewCustomGreen.heightAnchor.constraint(equalToConstant: 100),
            self.stackViewCustomGreen.widthAnchor.constraint(equalToConstant: 100),
            
            // MARK: - Constraints Orange Stack View
            self.stackViewCustomOrange.topAnchor.constraint(equalTo: self.scrollViewcustom.topAnchor, constant: 30),
            self.stackViewCustomOrange.leadingAnchor.constraint(equalTo: self.stackViewCustomGreen.leadingAnchor, constant: 120),
            self.stackViewCustomOrange.heightAnchor.constraint(equalToConstant: 100),
            self.stackViewCustomOrange.widthAnchor.constraint(equalToConstant: 100),
        ])
    }
    
    func extraSetupConfiguration() {
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
