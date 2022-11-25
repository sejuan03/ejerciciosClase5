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
    
    @IBAction func createButtonPressed(_ sender: Any) {
        processCredentials()
    }
    
    private func processCredentials() {
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        let checkPassword = checkPasswordTextField.text ?? ""
        checkEmptyFields(email, password, checkPassword)
    }
    
    private func checkEmptyFields(_ email: String, _ password: String, _ checkPassword: String) {
        if email.isEmpty || password.isEmpty || checkPassword.isEmpty {
            showResultMessage(Constant.emptyFieldsMessage)
        } else {
            validateCredentials(email,password,checkPassword)
        }
    }
    
    private func showResultMessage(_ message: String) {
        resultLabel.text = message
        resultLabel.isHidden = false
    }
       
    private func validateCredentials(_ email: String,_ password: String, _ checkPassword: String) {
        var message: String
        if email == Constant.existingEmail {
            message = resultMessage(1)
        } else if password != checkPassword {
            message = resultMessage(2)
        } else {
            message = resultMessage(3)
        }
        showResultMessage(message)
    }
    
    private func resultMessage(_ messageCase: Int) -> String {
        switch messageCase {
        case 1: return Constant.errorMessage
        case 2: return Constant.passwordsDontMatch
        default: return Constant.successMessage
        }
    }
}
