//
//  RegisterViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var validationTextfield: UILabel!
    
    
    @IBAction func registerPressed(_ sender: UIButton) {
        
        if let email = emailTextfield.text, let password = passwordTextfield.text{
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let e = error{
                    self.validationTextfield.text = e.localizedDescription
                    
                    self.validationTextfield.isHidden = false
                    
                    print(e.localizedDescription)
                }else{
                    //Navigate to the ChatViewController
                    self.performSegue(withIdentifier: K.registerSegue, sender: self)
                }
            }
        }
        
    }
    
}
