//
//  ViewController.swift
//  Clase6Ejercicio2
//
//  Created by Mac on 30/11/22.
//

import UIKit

class ViewController: UIViewController {
    
    struct Constant {
        static let imageNotFound = "interrogante"
        static let animalList = ["perro", "gato"]
        static let segueToScore = "goToAnimalScore"
    }
        
    @IBOutlet weak var animalLabel: UILabel!
    @IBOutlet weak var animalImageView: UIImageView!
    @IBOutlet weak var goToScoreButton: UIButton!
       
    var animalIndex = 1
    var animalName = ""
    var buttonState = false
    var shuffleState = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateAnimal()
        setAnimal()
        validateAnimalExist()
        setViewVisibility()
    }
    
    @IBAction func goToScoreButtonPressed() {
        performSegue(withIdentifier: Constant.segueToScore, sender: self)
    }
    
    @IBAction func shuffleButtonPressed() {
        updateAnimal()
        setAnimal()
        validateAnimalExist()
        setViewVisibility()
    }
    
    private func updateAnimal() {
        animalIndex = Int.random(in: 0...5)
        if animalIndex < Constant.animalList.count{
            animalName = Constant.animalList[animalIndex]
        } else {
            animalName = Constant.imageNotFound
        }
    }
    
    private func setAnimal() {
        animalLabel.text = animalName
        animalImageView.image = UIImage(named: animalName)
    }
    
    private func validateAnimalExist() {
        buttonState = animalName != Constant.imageNotFound
    }
    
    private func setViewVisibility() {
        animalLabel.isHidden = !buttonState
        goToScoreButton.isEnabled = buttonState
    }
}

