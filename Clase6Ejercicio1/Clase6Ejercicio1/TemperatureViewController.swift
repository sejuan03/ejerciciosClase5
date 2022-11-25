//
//  TemperatureViewController.swift
//  Clase6Ejercicio1
//
//  Created by Mac on 24/11/22.
//

import UIKit

class TemperatureViewController: UIViewController {
    
    private struct Constant {
        static let emptyField = "Campo Vacio"
        static let writeNumberMessage = "Escribir un numero correcto"
    }
    
    @IBOutlet weak var centigradesTextField: UITextField!
    @IBOutlet weak var farenheitTextField: UITextField!
    @IBOutlet weak var resultFarenheitLabel: UILabel!
    @IBOutlet weak var resultCentigradesLabel: UILabel!
    
    var convertCelsius = false
    
    
    @IBAction func logoutButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    @IBAction func convertButtonToFarenheitPressed(_ sender: Any) {
        convertCelsius = true
        checkEmptyField(centigradesTextField.text)
    }
    
    @IBAction func convertButtonToCentigradesPressed(_ sender: Any) {
        convertCelsius = false
        checkEmptyField(farenheitTextField.text)
    }
    
    private func checkEmptyField(_ gradesField: String?) {
        let grades = gradesField ?? ""
        if grades.isEmpty {
            showResultMessage(Constant.emptyField)
        } else {
            processGrades(grades)
        }
    }
    
    private func showResultMessage(_ message: String) {
        if convertCelsius {
            resultFarenheitLabel.text = message
            resultFarenheitLabel.isHidden = false
        } else {
            resultCentigradesLabel.text = message
            resultCentigradesLabel.isHidden = false
        }
    }
    
    private func processGrades(_ grades: String) {
        if let doubleGrades = Double(grades) {
            defineWhichTemperatureOperation(doubleGrades)
        } else {
            showResultMessage(Constant.writeNumberMessage)
        }
    }
    
    private func defineWhichTemperatureOperation(_ grades: Double) {
        if convertCelsius {
            let farenheit = convertCentigradesToFarenheit(grades)
            showResultMessage(farenheit + " °F")
        } else {
            let celsius = convertFarenheitToCentigrades(grades)
            showResultMessage(celsius + " °C")
        }
    }
    private func convertCentigradesToFarenheit(_ centigrades: Double) -> String {
        return String(((centigrades*9/5)+32).rounded(toPlaces: 2))
    }
    
    private func convertFarenheitToCentigrades(_ farenheit: Double) -> String {
        return String(((farenheit-32)*5/9).rounded(toPlaces: 2))
    }
}
