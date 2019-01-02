//
//  WhatsTheImageViewController.swift
//  Guess something game
//
//  Created by Calvin Cantin on 18-09-19.
//  Copyright © 2018 Calvin Cantin. All rights reserved.
//

import UIKit
var imageDictionary = ["Maison": #imageLiteral(resourceName: "image 1"),"Bateau": #imageLiteral(resourceName: "image2") ,"Train": #imageLiteral(resourceName: "image 3"),"Vase": #imageLiteral(resourceName: "image 4")]
let totalWord = imageDictionary.count + 1
var currentGameIndex = 0

class WhatsTheImageViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet var lettersButtons: [UIButton]!
    @IBAction func lettersButtonsPressed(_ sender: UIButton) {
        sender.isEnabled = false
        let letter = sender.title(for: .normal)!
        let lowCasedLetter = Character(letter.lowercased())
        currentGame.playerGuessed(lowCasedLetter)
        if currentGame.answer.lowercased() == currentGame.gussedAnswer
        {
            newRound()
            
        }
        updateUI()
    }
    func updateUI()
    {
        let word = currentGame.gussedAnswer.map{String($0)}
        let spacingWord = word.joined(separator: " ")
        wordLabel.text = spacingWord
        imageView.image = currentGame.image
        
        
    }
    var currentGame: Game!
    // Initialisation de l'image et du mot
    func newRound()
    {
        if !imageDictionary.isEmpty
        {
            setButtonStatus(true)
            guard let word = imageDictionary.first?.key else {return}
            guard let value = imageDictionary.first?.value else {return}
            currentGame = Game(answer:word, image:value, guessedLetter: [])
            imageDictionary[currentGame.answer] = nil
            currentGameIndex += 1
            updateUI()
        }
        else
        {
            setButtonStatus(false)
        }
    }
    func setButtonStatus(_ enable: Bool)
    {
        for button in lettersButtons
        {
            button.isEnabled = enable
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
