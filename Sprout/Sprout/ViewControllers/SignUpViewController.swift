//
//  SignUpViewController.swift
//  LoginDemo
//
//  Created by Kristina Yin on 7/28/20.
//  Copyright © 2020 Kristina Yin. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseFirestore

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var signUpButton: UIButton!
    
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
        Utilities.styleTextField(usernameTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleTextField(emailTextField)
        Utilities.styleFilledButton(signUpButton)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func validateFields() -> String? {
           
           // check that all fields are filled
           if usernameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
               
               return "Please fill in all fields."
           }
           
           // check if password is secure
           let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
           
           if Utilities.isPasswordValid(cleanedPassword) == false {
               // password isn't secure enough
               return "Please make sure your password is at least 8 characters, contains a special character and a number."
           }
           
           return nil
       }
    
    
    
    @IBAction func signUpTapped(_ sender: Any) {
        // validate the fields
        let error = validateFields()
        
        if error != nil {
            // there is something wrong with the fields, show error message
            showError("error!")
        } else {
            
            // create cleaned versions of the data
            let username = usernameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            // create the user
            Auth.auth().createUser(withEmail: "", password: "") { (result, err) in
                
                if err != nil {
                    // there was an error creating the user
                    self.showError("Error creating user")
                } else {
                    // data validated, let user store data
                    let db = Firestore.firestore()
                    
                    db.collection("users").addDocument(data: ["username":username, "password":password, "uid":result!.user.uid, "email":email]) { (error) in
                        
                        if error != nil {
                            self.showError("Error saving user data.")
                        }
                    }
                    
                    // transition to home screen
                    self.transitionToHome()
                }
            }
        }
    }
        
    func showError(_ message:String) {
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    
    func transitionToHome() {
        let homeViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? HomeViewController
        
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
    }
    
}
