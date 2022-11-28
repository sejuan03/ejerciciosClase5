//
//  RegisterViewController.swift
//  Clase6Ejercicio1
//
//  Created by Mac on 24/11/22.
//

import UIKit

class RegisterViewController: UIViewController {
    
    private struct Constant {
        static let existingEmail = "test@test.com"
        static let emptyFieldsMessage = "Introducir todos los datos"
        static let errorMessage = "Error, Usuario ya Existe"
        static let passwordsDontMatch = "Contraseñas no coinciden"
        static let successMessage = "Registro exitoso"
    }

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var checkPasswordTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    private var message = ""
    
    @IBAction func createButtonPressed(_ sender: Any) {
        processCredentials()
    }
    
    private func processCredentials() {
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        let checkPassword = checkPasswordTextField.text ?? ""
        validateCredentials(email,password,checkPassword)
        showResultMessage()
    }
    
    private func validateCredentials(_ email: String,_ password: String, _ checkPassword: String) {
        if email.isEmpty || password.isEmpty || checkPassword.isEmpty {
            message = Constant.emptyFieldsMessage
        } else if email == Constant.existingEmail {
            message = Constant.errorMessage
        } else if password != checkPassword {
            message = Constant.passwordsDontMatch
        } else {
            message = Constant.successMessage
        }
    }
    
    private func showResultMessage() {
        resultLabel.text = message
        resultLabel.isHidden = false
    }
}
