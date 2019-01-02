//
//  WhatsTheImageGame.swift
//  Guess something game
//
//  Created by Calvin Cantin on 18-09-19.
//  Copyright © 2018 Calvin Cantin. All rights reserved.
//

import UIKit
struct Game
{
    var answer: String
    var image: UIImage
    var guessedLetter: [Character]
    // création du bon mot par le joueur
    var gussedAnswer: String
    {
        return String(answer.lowercased().map{guessedLetter.contains($0) ? $0: "_"})
    }
    mutating func playerGuessed(_ letter: Character)
    {
        guessedLetter.append(letter)
    }
}
