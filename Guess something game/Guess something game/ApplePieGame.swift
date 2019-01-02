//
//  ApplePieGame.swift
//  Guess something game
//
//  Created by Calvin Cantin on 18-09-19.
//  Copyright © 2018 Calvin Cantin. All rights reserved.
//

import Foundation
struct ApplePieGame
{
    static var totalPoint: Int = 0
    var answer: String
    var incorectMovesRemaining: Int
    var guessedLetters: [Character]
    
    var guessedAnswer:String
    {
        return String(answer.lowercased().map{guessedLetters.contains($0) ? $0:"_"})
    }
    
    mutating func playerGuessed(letter: Character)
    {
        guessedLetters.append(letter)
        if !answer.contains(letter)
        {
            incorectMovesRemaining -= 1
        }
    }
}
