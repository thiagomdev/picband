//
//  DetailBandViewController.swift
//  PicBand
//
//  Created by Thiago Monteiro  on 6/27/21.
//

import UIKit

class DetailBandViewController: UIViewController {

    // MARK: - Properties
    var detailScreenBand: DetailScreenBand?

        
    // MARK: - Super Methods
    
    override func loadView() {
        self.detailScreenBand = DetailScreenBand()
        self.view = self.detailScreenBand
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Pick your best band"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.navigationBar.prefersLargeTitles = false
    }

    // MARK: Methods
}
