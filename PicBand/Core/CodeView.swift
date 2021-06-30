//
//  CodeView.swift
//  PicBand
//
//  Created by Thiago Monteiro  on 6/24/21.
//

import Foundation

protocol CodeView {
    func buildViewHierarchy()
    func setupConstraints()
    func extraSetupConfiguration()
    func setup()
    
}

extension CodeView {
    func setup() {
        buildViewHierarchy()
        setupConstraints()
        extraSetupConfiguration()
    }
}
