//
//  DetailScreenBand.swift
//  PicBand
//
//  Created by Thiago Monteiro  on 6/27/21.
//

import UIKit

protocol DetailScreenBandDelegate: AnyObject {
    func dismissButton()
}
class DetailScreenBand: UIView, CodeView {

    // MARK: - Properties
    weak var delegate: DetailScreenBandDelegate?
    
    // MARK: - Elements
    let scrollViewcustom: UIScrollView = {
        let scrollView = UIScrollView(frame: .zero)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.keyboardDismissMode = .interactive
        scrollView.contentSize = CGSize(width: scrollView.frame.size.width, height: 1000)
        return scrollView
    }()
    
    
    lazy var stackViewCustomRed: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 10
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.backgroundColor = .red
        return stack
    }()
    
    lazy var stackViewCustomBlue: UIStackView = {
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
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    func buildViewHierarchy() {
        self.addSubview(scrollViewcustom)
        self.scrollViewcustom.addSubview(stackViewCustomRed)
        self.scrollViewcustom.addSubview(stackViewCustomBlue)
        
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            // MARK: - Constraints Scroll View
            self.scrollViewcustom.topAnchor.constraint(equalTo: self.topAnchor),
            self.scrollViewcustom.leftAnchor.constraint(equalTo: self.leftAnchor),
            self.scrollViewcustom.rightAnchor.constraint(equalTo: self.rightAnchor),
            self.scrollViewcustom.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            // MARK: - Constraints Red Stack View
            self.stackViewCustomRed.topAnchor.constraint(equalTo: self.scrollViewcustom.topAnchor, constant: 30),
            self.stackViewCustomRed.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.stackViewCustomRed.heightAnchor.constraint(equalToConstant: 100),
            self.stackViewCustomRed.widthAnchor.constraint(equalToConstant: 100),
            
            // MARK: - Constraints Blue Stack View
            self.stackViewCustomBlue.topAnchor.constraint(equalTo: self.scrollViewcustom.topAnchor, constant: 30),
            self.stackViewCustomBlue.leadingAnchor.constraint(equalTo: self.stackViewCustomRed.leadingAnchor, constant: 120),
            self.stackViewCustomBlue.heightAnchor.constraint(equalToConstant: 100),
            self.stackViewCustomBlue.widthAnchor.constraint(equalToConstant: 100),
          
            
        ])
    }
    
    func extraSetupConfiguration() {
        
    }
}
