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
    
    let user = User()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameTextField.delegate = self
        passwordTextField.delegate = self
        
        userNameTextField.text = user.login
        passwordTextField.text = user.password
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarController = segue.destination as? UITabBarController else { return }
        guard let viewControllers = tabBarController.viewControllers else { return }
        
        for viewController in viewControllers {
            if let welcomeVC = viewController as? WelcomeViewController {
                welcomeVC.userName = user.person.fullname
            }
            else if let navigationVC = viewController as? UINavigationController {
                navigationVC.title = user.person.fullname
                
                guard let userVC = navigationVC.topViewController as? UserViewController
                else { return }
            
                userVC.user = user
                }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }

    @IBAction func logInButtonPressed() {
        if userNameTextField.text != user.login || passwordTextField.text != user.password {
            showAlert(title: "Invalid Login or Password",
                      message: "Please, enter correct login and password",
                      textField: passwordTextField)
        }
    }
    
    
    @IBAction func forgotButtonPressed(_ sender: UIButton) {
        sender.tag == 0
            ? showAlert(title: "Ooops!", message: "Your User name is \(user.login) 😊")
            :showAlert(title: "Ooops!", message: "Your password is \(user.password) 😊")
    }
    
    @IBAction func unwind(for seque: UIStoryboardSegue) {
        userNameTextField.text = ""
        passwordTextField.text = ""
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
    
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

