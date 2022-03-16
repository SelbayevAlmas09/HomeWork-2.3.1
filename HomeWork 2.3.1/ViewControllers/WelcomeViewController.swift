//
//  WelcomeViewController.swift
//  HomeWork 2.3.1
//
//  Created by Almas Selbayev on 09.03.2022.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet var welcomeLabel: UILabel!
    @IBOutlet var emojiLabel: UILabel!
    
    var userName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        welcomeLabel.text = "Welcome, " + userName + "!"
        emojiLabel.text = "👋🏼"
        
        setGradientLayer()
    }
    
    private func setGradientLayer() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor.systemPink.cgColor,
                                UIColor.systemCyan.cgColor]
        
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
}
