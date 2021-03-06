//
//  ViewController.swift
//  BillOrSteve
//
//  Created by James Campagno on 6/8/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Create your stored properties here
    var personFacts: [String: [String]] = [:]
    var score: Int = 0
    var currentRound: Int = 1
    var fact: (String, String) = ("", "")
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var factLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.text = String(score)
        createFacts()
        resetFact()
    }
    
    
    @IBAction func selectAnswer(_ sender: UIButton) {
        var selectedPerson: String = ""
        if let title = sender.currentTitle {
            if title == "steve" {
                selectedPerson = "Steve Jobs"
            } else {
                selectedPerson = "Bill Gates"
            }
        }
        print(selectedPerson)
        if checkIfMatch(yourAnswer: selectedPerson, correctAnswer: fact) {
            score += 1
            scoreLabel.text = String(score)
        } else {
            score = 0
            scoreLabel.text = String(score)
        }
        resetFact()

    }
    
    
    // Helper Functions
    
    func resetFact() {
        fact = getRandomFact()
        factLabel.text = fact.1
    }
    func checkIfMatch(yourAnswer: String, correctAnswer: (String, String)) -> Bool {
        let correctAnswerName = correctAnswer.0
        if yourAnswer == correctAnswerName {
            return true
        }
        return false
    }
    
    func randomIndex(fromArray array: [String]) -> Int {
        return Int(arc4random_uniform(UInt32(array.count)))
    }
    
    func randomPerson() -> String {
        let randomNumber = arc4random_uniform(2)
        
        if randomNumber == 0 {
            return "Steve Jobs"
        } else {
            return "Bill Gates"
        }
    }
    
    func getRandomFact() -> (String, String) {
        let person = randomPerson()
        if var facts = personFacts[person] {
            let index = randomIndex(fromArray: facts)
            let fact = facts[index]
            return (person, fact)
        }
        return ("", "")
    }
    
    func createFacts() {
        let steveFacts = [
            "He took a calligraphy course, which he says was instrumental in the future company products' attention to typography and font.",
            "Shortly after being shooed out of his company, he applied to fly on the Space Shuttle as a civilian astronaut (he was rejected) and even considered starting a computer company in the Soviet Union.",
            "He actually served as a mentor for Google founders Sergey Brin and Larry Page, even sharing some of his advisers with the Google duo.",
            "He was a pescetarian, meaning he ate no meat except for fish."
        ]
        let billFacts = [
            "He aimed to become a millionaire by the age of 30. However, he became a billionaire at 31.",
            "He scored 1590 (out of 1600) on his SATs.",
            "His foundation spends more on global health each year than the United Nation's World Health Organization.",
            "The private school he attended as a child was one of the only schools in the US with a computer. The first program he ever used was a tic-tac-toe game.",
            "In 1994, he was asked by a TV interviewer if he could jump over a chair from a standing position. He promptly took the challenge and leapt over the chair like a boss."
        ]
        personFacts["Steve Jobs"] = steveFacts
        personFacts["Bill Gates"] = billFacts
    }
    
}
