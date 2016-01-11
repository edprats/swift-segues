//
//  ResultsViewController.swift
//  RPS
//
//  Created by Eduardo Prats on 1/9/16.
//  Copyright © 2016 edprats. All rights reserved.
//

import UIKit

enum Shape: String {
    case Rock = "Rock"
    case Paper = "Paper"
    case Scissors = "Scissors"
    
    static func generateRandomShape() -> Shape {
        let shapes = ["Rock", "Paper", "Scissors"]
        let randomIndex = Int(arc4random() % 3)
        return Shape(rawValue: shapes[randomIndex])!
    }
}

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var resultImage: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!
    
    var opponentChoice: Shape!
    var userChoice: Shape!

    override func viewDidLoad() {
        super.viewDidLoad()
        opponentChoice = Shape.generateRandomShape()
                
        print(opponentChoice!)
        playGame()
    }
    
    @IBAction func playAgainButtonPressed(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func playGame() {
        let matchup = "\(userChoice!) vs \(opponentChoice!)"
        switch (userChoice!, opponentChoice!) {
        case let (user, opponent) where user == opponent:
            resultImage.image = UIImage(named: "tie")
            resultLabel.text = "\(matchup) is a tie"
        case (.Rock, .Scissors), (.Paper, .Rock), (.Scissors, .Paper):
            resultImage.image = UIImage(named: "\(userChoice)-\(opponentChoice)")
            resultLabel.text = "You win with \(matchup)"
        default:
            resultImage.image = UIImage(named: "\(userChoice)-\(opponentChoice)")
            resultLabel.text = "You lose with \(matchup)"
        }
    }
}
