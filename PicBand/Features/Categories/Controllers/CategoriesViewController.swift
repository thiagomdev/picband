//
//  CategoriesViewController.swift
//  PicBand
//
//  Created by Thiago Monteiro  on 6/26/21.
//

import UIKit

class CategoriesViewController: UIViewController {
    
    var categoriesScreen: CategoriesScreen?
    
    override func loadView() {
        self.categoriesScreen = CategoriesScreen()
        self.view = self.categoriesScreen
        self.categoriesScreen?.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.navigationController?.navigationBar.prefersLargeTitles = false
    }
}

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
