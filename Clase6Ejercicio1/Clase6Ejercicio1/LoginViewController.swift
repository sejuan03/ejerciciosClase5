//
//  ViewController.swift
//  Clase6Ejercicio1
//
//  Created by Mac on 24/11/22.
//

import UIKit

class LoginViewController: UIViewController {

    private struct Constant {
        static let expectedEmail = "hola@test.com"
        static let expectedPassword = "12345"
        static let emptyFieldsMessage = "Llenar todos los datos"
        static let failureMessage = "Credenciales Invalidas"
        static let segueToTemperatureView = "navigateToTemperatureViewController"
    }
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
   private var message = ""
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        processCredentials()
    }
        
    private func processCredentials() {
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        validateCredentials(email,password)
        showResultMessage()
    }
    
    private func validateCredentials(_ email: String,_ password: String) {
        if email.isEmpty || password.isEmpty {
            message = Constant.emptyFieldsMessage
        } else if email == Constant.expectedEmail && password == Constant.expectedPassword  {
            successfullInstance()
        } else {
            message = Constant.failureMessage
        }
    }
    
    private func successfullInstance() {
        message = ""
        performSegue(withIdentifier: Constant.segueToTemperatureView, sender: self)
    }
    
    private func showResultMessage() {
        resultLabel.text = message
        resultLabel.isHidden = false
    }   
}

