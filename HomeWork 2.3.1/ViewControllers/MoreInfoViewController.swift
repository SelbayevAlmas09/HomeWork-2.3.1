//
//  MoreInfoViewController.swift
//  HomeWork 2.3.1
//
//  Created by Almas Selbayev on 15.03.2022.
//

import UIKit

class MoreInfoViewController: UIViewController {

    @IBOutlet var workPlaceTF: UITextField!
    @IBOutlet var positionTF: UITextField!
    
    @IBOutlet var aboutMeLabel: UILabel!
    var user = User()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        positionTF.text = user.person.job.position
        workPlaceTF.text = user.person.job.workPlace
        aboutMeLabel.text = user.person.aboutMe
    }
    

}
