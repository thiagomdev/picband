//
//  ExyensionCategoryViewController.swift
//  ExyensionCategoryViewController
//
//  Created by Thiago Monteiro on 08/08/21.
//

import UIKit
import Firebase

extension CategoriesViewController: CategoriesScreenDelegate {
    func enterMusician() {
        let detailMusician = DetailMusicianViewController()
        self.navigationController?.pushViewController(detailMusician, animated: true)
    }
    
    func enterBands() {
        let detailBand = DetailBandViewController()
        self.navigationController?.pushViewController(detailBand, animated: true)
    }
    
    func backButton() {
        self.navigationController?.popViewController(animated: true)
    }
    
}
