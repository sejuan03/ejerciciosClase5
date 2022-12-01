//
//  AnimalScoreViewController.swift
//  Clase6Ejercicio2
//
//  Created by Mac on 30/11/22.
//

import UIKit

class AnimalScoreViewController: UIViewController {

    struct Constant {
        static let errorEmpty = "Campo vacio"
        static let errorIsNotInt = "Dato invalido"
        static let scoreRange = 1...5
    }
    
    @IBOutlet weak var scoreTextField: UITextField!
    @IBOutlet weak var resultMessageLabel: UILabel!
    
    private var score = ""
    private var scoreIsNotEmpty = false
    private var scoreIsInt = false
    private var message = ""
    private var scoreInRange = false
    
    
    @IBAction func scoreButtonPressed(_ sender: Any) {
        validateScoreField()
        validateScoreInRange()
        setResult()
        showResultMessage()
    }
    
    private func validateScoreField() {
        score = scoreTextField.text ?? ""
        scoreIsInt = Int(score) != nil
        scoreIsNotEmpty = !score.isEmpty
    }
    
    private func validateScoreInRange() {
        guard let scoreInt = Int(score) else {
            return
        }
        for i in Constant.scoreRange {
            if i == scoreInt {
                scoreInRange = true
            }
        }
    }
    
    private func setResult() {
        if scoreIsInt && scoreIsNotEmpty && scoreInRange {
            dismiss(animated: true)
        } else if !scoreIsNotEmpty {
            message = Constant.errorEmpty
        } else {
            message = Constant.errorIsNotInt
        }
    }
    
    private func showResultMessage() {
        resultMessageLabel.text = message
        resultMessageLabel.isHidden = scoreInRange
    }
}
