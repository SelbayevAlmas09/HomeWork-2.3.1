//
//  ViewController.swift
//  HomeWork 2.3.1
//
//  Created by Almas Selbayev on 09.03.2022.
//

import UIKit

class LogInViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    @IBOutlet var logInButton: UIButton!
    @IBOutlet var forgotUserNameButton: UIButton!
    @IBOutlet var forgotPasswordButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        welcomeVC.userName = userNameTextField.text
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTextField {
            passwordTextField.becomeFirstResponder()
        }
        else {
            logInButton.sendActions(for: .touchUpInside)
        }

        return true
    }

    @IBAction func logInButtonPressed() {
        if userNameTextField.text != "User" || passwordTextField.text != "Password" {
            passwordTextField.text = ""
            
            showAlert(title: "Invalid Login or Password",
                      message: "Please, enter correct login and password")
        }
    }

    @IBAction func forgotButtonPressed(_ sender: UIButton) {
        switch sender {
        case forgotUserNameButton:
            showAlert(title: "Ooops!", message: "Your User name is User 😊")
        default:
            showAlert(title: "Ooops!", message: "Your password is Password 😊")
        }
    }
    
    @IBAction func unwind(for seque: UIStoryboardSegue, sender: Any?) {
        userNameTextField.text = ""
        passwordTextField.text = ""
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

