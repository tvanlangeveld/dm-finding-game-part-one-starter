//
//  GameBrain.swift
//  DMFindingGame
//
//  Created by David Ruvinskiy on 4/17/23.
//

import Foundation

class GameBrain {
    
    static let shared = GameBrain()
    var targetLetter = ""
    var randomLetters = [String]()
    var score = 0
    var highScore = 0
    var numLetters = 0
    var secondsRemaining = 30
    var letters = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    
    
    func generateRandomLetters() -> [String] {
        var randomGameLetters: [String] = []
        randomGameLetters.append(targetLetter)
        
        for _ in 1..<numLetters {
            var randomLet: String = letters.randomElement()!
            while randomGameLetters.contains(randomLet) {
                 randomLet = letters.randomElement()!
            }
            randomGameLetters.append(randomLet)
        }

                return randomGameLetters.shuffled()
    }
        
    
    func newRound() {
        targetLetter = letters.randomElement()!
        randomLetters = generateRandomLetters()
    }
    
    func newGame(numLetters: Int){
        
        self.numLetters = numLetters
        secondsRemaining = 30
        score = 0
        newRound()
    }
    
    func letterSelected(letterPressed: String){
       
        if targetLetter == letterPressed {
            score += 1
        }
        
        if score > highScore {
            highScore = score
        }
        
        print("HighScore:\(highScore)")
        newRound()
        
        
        
    }
    
}
