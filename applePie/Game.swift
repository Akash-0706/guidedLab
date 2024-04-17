//
//  Game.swift
//  applePie
//
//  Created by Akash  on 23/02/24.
//

import Foundation

struct Game{
    var word:String
    var incorrectMovesRemaining:Int
    
    var guessedLetters: [Character]
    
    var formattedWord: String {
        var guessedWord = ""
        for letter in word {
            if guessedLetters.contains(letter) {
                guessedWord += "\(letter)"
            } else {
                guessedWord += "_ "
            }
        }
        return guessedWord
    }
    
    mutating func playerGuessed(letter: Character) {
      guessedLetters.append(letter)
      if !word.contains(letter) {
        incorrectMovesRemaining -= 1
      }
    }
}
