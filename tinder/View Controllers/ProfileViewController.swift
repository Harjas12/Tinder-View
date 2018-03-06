//
//  ProfileViewController.swift
//  tinder
//
//  Created by Harjas Monga on 3/5/18.
//  Copyright © 2018 Harjas Monga. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var profileImage: UIImage? = nil
    @IBOutlet weak var profileImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileImageView.image = profileImage
    }
    @IBAction func navBarClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
