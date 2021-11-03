//
//  ResultViewController.swift
//  PersonalityQuiz
//
//  Created by Alexey Efimov on 30.08.2021.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet var emojiLabel: UILabel!
    @IBOutlet var definitionLabel: UILabel!
    
    var answers: [Answer]!
 
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.hidesBackButton = true
        getAnimal()
    }
    
    private func getAnimal() {
        var getCountAnimal: [Animal: Int] = [:]
        let animals = answers.map { $0.animal }
        
        animals.forEach {
            if let animalCount = getCountAnimal[$0] {
                getCountAnimal.updateValue(animalCount + 1, forKey: $0)
            } else {
                getCountAnimal[$0] = 1
            }
        }
        
        let sortedAnimals = getCountAnimal.sorted { $0.value > $1.value}
        guard let myAnimal = sortedAnimals.first?.key else { return }
        
        updateUI(with: myAnimal)
    }
    
    private func updateUI(with animal: Animal) {
        emojiLabel.text = "Вы - \(animal.rawValue)!"
        definitionLabel.text = "\(animal.definition)"
    }
    
}
