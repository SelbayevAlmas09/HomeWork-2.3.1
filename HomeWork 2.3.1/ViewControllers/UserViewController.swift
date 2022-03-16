//
//  UserViewController.swift
//  HomeWork 2.3.1
//
//  Created by Almas Selbayev on 15.03.2022.
//

import UIKit

class UserViewController: UIViewController {
    
    var user: User!

    @IBOutlet var fullNameTextField: UITextField!
    @IBOutlet var ageTextField: UITextField!

    @IBOutlet var jobTitleTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = user.person.fullname
        
        fullNameTextField.text = user.person.fullname
        ageTextField.text = String(user.person.age)
        jobTitleTextField.text = user.person.job.title
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let moreInfoController = segue.destination as? MoreInfoViewController
        else { return }
        
        moreInfoController.user = user
    }
    


}
