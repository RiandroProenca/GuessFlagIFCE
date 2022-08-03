//
//  ViewController.swift
//  QuessTheFlag
//
//  Created by Riandro Proença on 01/08/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var flagOne: UIButton!
    @IBOutlet weak var flagTwo: UIButton!
    @IBOutlet weak var flagThree: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        buttonDesign(button: flagOne)
        buttonDesign(button: flagTwo)
        buttonDesign(button: flagThree)
        
        askQuestion()
    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        flagOne.setImage(UIImage(named: countries[0]), for: .normal)
        flagTwo.setImage(UIImage(named: countries[1]), for: .normal)
        flagThree.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = countries[correctAnswer].uppercased()
    }

    func updateScoreUp() {
        score += 1
        title = "🥳🥳🥳🥳🥳"
    }
    
    func updateScoreDonw() {
        score -= 1
        title = "🥺🥺🥺🥺🥺"
    }

    func buttonDesign(button: UIButton) {
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.cornerRadius = 10
    }
    
    @IBAction func flagButtonTapped(_ sender: UIButton) {
        var title: String
        if sender.tag == correctAnswer {
            title = "Acertou!!"
            updateScoreUp()
            
        } else {
            title = "Errou!"
            updateScoreDonw()
        }

        let alert = UIAlertController(title: title, message: "Você Fez \(score)  ", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: askQuestion))
        present(alert, animated: true)
    }
    
}
