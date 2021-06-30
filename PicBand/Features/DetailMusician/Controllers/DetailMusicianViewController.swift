//
//  DetailMusicianViewController.swift
//  PicBand
//
//  Created by Thiago Monteiro  on 6/27/21.
//

import UIKit

class DetailMusicianViewController: UIViewController {

    // MARK: - Properties
    var detailScreenMusician: DetailScreenMusician?
    
    
    // MARK: - Super Methods
    override func loadView() {
        self.detailScreenMusician = DetailScreenMusician()
        self.view = self.detailScreenMusician
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Pick your Musician"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    // MARK: - Methods
}
