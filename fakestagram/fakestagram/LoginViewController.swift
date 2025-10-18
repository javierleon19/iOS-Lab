//
//  LoginViewController.swift
//  fakestagram
//
//  Created by Francisco Javier Gómez León on 11/10/25.
//

import UIKit

final class LoginViewController: UIViewController {
    
    @IBOutlet weak var userField: UITextField!
    @IBOutlet weak var passwordField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
//        print("user" , userField.text)
//        print("password", passwordField.text)
        logIn()
    }
    
    private func logIn(){
        performSegue(withIdentifier: "LoginHomeSegue", sender: nil)
    }

}

