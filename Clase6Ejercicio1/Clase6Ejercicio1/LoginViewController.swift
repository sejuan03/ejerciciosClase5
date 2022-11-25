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
        static let successMessage = "Credenciales Validas"
        static let failureMessage = "Credenciales Invalidas"
        static let segueToTemperatureView = "navigateToTemperatureViewController"
    }
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    private var result = false
    private var resultNotEmpty = false
    private var emailEmpty = false
    private var passwordEmpty = false
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        processCredentials()
    }
        
    private func processCredentials() {
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        resetStates()
        validateCredentials(email, password)
        processValidationResult(result, resultNotEmpty)
        
    }
    
    private func resetStates() {
        resultNotEmpty = false
        emailEmpty = false
        passwordEmpty = false
    }
    
    private func validateCredentials(_ email: String, _ password: String) {
        if !email.isEmpty && !password.isEmpty {
            resultNotEmpty = true
            result = email == Constant.expectedEmail && password == Constant.expectedPassword
        } else {
            emptyCredentials(email, password)
        }
        
    }
    
    private func emptyCredentials(_ email: String, _ password: String) {
        if email.isEmpty {
            emailEmpty = true
        }
        if password.isEmpty {
            passwordEmpty = true
        }
    }
    
    private func processValidationResult(_ result: Bool, _ resultNotEmpty: Bool) {
        var message = ""
        if result && resultNotEmpty {
            successfullInstance()
            resultLabel.isHidden = true
        } else if !result && resultNotEmpty {
            showResultMessages(Constant.failureMessage)
        } else {
            message = proccessEmptyCredentials()
            showResultMessages(message)
        }
    }
    
    private func successfullInstance() {
        performSegue(withIdentifier: Constant.segueToTemperatureView, sender: self)
    }
    
    private func showResultMessages(_ message: String) {
        resultLabel.text = message
        resultLabel.isHidden = false
    }
    
    private func proccessEmptyCredentials() -> String {
        if emailEmpty && passwordEmpty {
            return "Campos Vacios"
        } else if emailEmpty {
            emailTextField.isEnabled = true
            return "Correo vacio"
        } else {
            passwordTextField.isEnabled = true
            return "Password Vacio"
        }
    }
    
}

