//
//  AutoLayoutStudyViewController.swift
//  NewlyCoinedWord
//
//  Created by 이상남 on 2023/07/23.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet var profileImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpProfileImageView()
        // Do any additional setup after loading the view.
    }
    
    
    func setUpProfileImageView(){

        profileImageView.layer.cornerRadius = 40
        
    }

    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        
        dismiss(animated: true)
        
    }
    

}
