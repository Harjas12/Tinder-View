//
//  ViewController.swift
//  tinder
//
//  Created by Harjas Monga on 3/5/18.
//  Copyright © 2018 Harjas Monga. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var cardInitialCenter: CGPoint!

    override func viewDidLoad() {
        super.viewDidLoad()
        cardInitialCenter = imageView.center
    }
    @IBAction func cardPanned(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: self.view)
        switch sender.state {
            case .began:
                cardInitialCenter = imageView.center
                break
            case .changed:
                imageView.center = CGPoint(x: cardInitialCenter.x + translation.x, y: cardInitialCenter.y + translation.y)
                if translation.y > imageView.center.y {
                    imageView.transform = CGAffineTransform(rotationAngle: -translation.x/100)
                } else {
                    imageView.transform = CGAffineTransform(rotationAngle: translation.x/100)
                }
                break
            case .ended:
                if translation.x > 50 {
                    UIView.animate(withDuration: 0.3, animations: {
                        self.imageView.center.x += 500
                    })
                } else if translation.y < -50 {
                    UIView.animate(withDuration: 0.3, animations: {
                        self.imageView.center.x -= 500
                    })
                } else {
                    UIView.animate(withDuration: 0.3, animations: {
                        self.imageView.center = self.cardInitialCenter
                        self.imageView.transform = CGAffineTransform(rotationAngle: 0)
                    })
                }
                break
            default:
                break
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let profileViewController = segue.destination as! ProfileViewController
        profileViewController.profileImage = imageView.image
    }
    

}

