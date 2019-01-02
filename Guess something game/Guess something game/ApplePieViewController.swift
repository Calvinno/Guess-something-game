//
//  ViewController.swift
//  Guess something game
//
//  Created by Calvin Cantin on 18-09-18.
//  Copyright © 2018 Calvin Cantin. All rights reserved.
//

import UIKit
var listOfWord = ["laboratoire","moteur","sujet","chance","puissance","chaleur","raisin","conflit","canada"]
let incorectMovesAllowed = 7

class ApplePieViewController: UIViewController {
    var totalWin = 0
    {
        didSet{
            newRound()
        }
    }
    var totalLose = 0
    {
        didSet{
            newRound()
        }
    }
    @IBOutlet weak var treeImageView: UIImageView!
    @IBOutlet weak var correctWordLabel: UILabel!
    @IBOutlet var lettersButtons: [UIButton]!
    @IBAction func buttonPressed(_ sender: UIButton) {
        sender.isEnabled = false
        let letterString = sender.title(for: .normal)!
        let letter = Character(letterString.lowercased())
        currentGame.playerGuessed(letter: letter)
        if currentGame.answer.contains(letter)
        {
            ApplePieGame.totalPoint += 5
        }
        updateGameState()
    }
    func updateGameState()
    {
        if currentGame.incorectMovesRemaining == 0
        {
            totalLose += 1
        }
        else if currentGame.guessedAnswer == currentGame.answer
        {
            totalWin += 1
            ApplePieGame.totalPoint += 10
        }
        else
        {
            updateUI()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
        // Do any additional setup after loading the view, typically from a nib.
    }
    var currentGame: ApplePieGame!
    func newRound()
    {
        if !listOfWord.isEmpty{
            let newWord = listOfWord.removeFirst()
            currentGame = ApplePieGame(answer: newWord, incorectMovesRemaining: incorectMovesAllowed,guessedLetters: [])
            enableLetterButton(true)
            updateUI()
        }
        else
        {
            enableLetterButton(false)
        }
    }
    func enableLetterButton(_ enable: Bool)
    {
        for button in lettersButtons
        {
            button.isEnabled = enable
        }
    }
    func updateUI()
    {
        let letters = currentGame.guessedAnswer.map{String($0)}
        let wordWithSpacing = letters.joined(separator: " ")
        correctWordLabel.text = wordWithSpacing
        
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorectMovesRemaining)")
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

