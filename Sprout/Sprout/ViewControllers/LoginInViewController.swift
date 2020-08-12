//
//  LoginInViewController.swift
//  LoginDemo
//
//  Created by Kristina Yin on 7/28/20.
//  Copyright © 2020 Kristina Yin. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class LoginInViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpElements()
    }
    
    func setUpElements() {
        
        // hide error label
        errorLabel.alpha = 0
        
        // style elements
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(loginButton)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func loginTapped(_ sender: Any) {
        // Validate text fields
        func validateFields() -> String? {
            
            // check that all fields are filled
            if emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
                
                return "Please fill in all fields."
            }
            
            return nil
        }
        // Signing in the user
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
          // ...
        }
        
    }
    

}
