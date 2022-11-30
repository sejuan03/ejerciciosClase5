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
        static let bigError = "Error"
    }
    
    @IBOutlet weak var centigradesTextField: UITextField!
    @IBOutlet weak var farenheitTextField: UITextField!
    @IBOutlet weak var resultFarenheitLabel: UILabel!
    @IBOutlet weak var resultCentigradesLabel: UILabel!
    
    var validTemperature = false
    var convertCelsius = false
    var grades = ""
    var message = ""
    var resultLabel: UILabel?
    var temperatureIsNumeric = false
    
    
    @IBAction func logoutButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    @IBAction func convertButtonToFarenheitPressed(_ sender: Any) {
        prepareDataToConvertCelsius()
        validateTemperatureField()
        setConvertionMessageResult()
        showResultMessage()
    }
    
    @IBAction func convertButtonToCentigradesPressed(_ sender: Any) {
        prepareDataToConvertFarenheit()
        validateTemperatureField()
        setConvertionMessageResult()
        showResultMessage()
    }
    
    private func prepareDataToConvertCelsius() {
        convertCelsius = true
        grades = centigradesTextField.text ?? ""
        resultLabel = resultFarenheitLabel
    }
    
    private func prepareDataToConvertFarenheit() {
        convertCelsius = false
        grades = farenheitTextField.text ?? ""
        resultLabel = resultCentigradesLabel
    }
    
    private func validateTemperatureField()  {
        temperatureIsNumeric = Double(grades) != nil
        validTemperature = !grades.isEmpty
    }
    
    private func setConvertionMessageResult() {
        if validTemperature && temperatureIsNumeric {
            message = processGrades()
        } else if validTemperature {
            message = Constant.writeNumberMessage
        } else {
            message = Constant.emptyField
        }
    }
    
    private func processGrades() -> String {
        assert(validTemperature)
        guard let gradesNumeric = Double(grades) else {
            validTemperature = false
            return Constant.bigError
        }
        if convertCelsius {
            let farenheit = convertCentigradesToFarenheit(gradesNumeric)
            return parseTemperature(farenheit) + " °F"
        } else {
            let celsius = convertFarenheitToCentigrades(gradesNumeric)
            return parseTemperature(celsius) + " °C"
        }
    }
    
    private func convertCentigradesToFarenheit(_ centigrades: Double) -> Double {
        return (centigrades*9/5)+32
    }
    
    private func convertFarenheitToCentigrades(_ farenheit: Double) -> Double {
        return (farenheit-32)*5/9
    }
    
    private func parseTemperature(_ temperature: Double) -> String {
        return String(temperature.rounded(toPlaces: 2))
    }
    
    private func showResultMessage() {
        guard let resultLabel = resultLabel else {
            return
        }
            resultLabel.text = message
            resultLabel.isHidden = false
    }
}
