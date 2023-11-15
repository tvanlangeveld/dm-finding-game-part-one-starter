//
//  GameViewController.swift
//  DMFindingGame
//
//  Created by David Ruvinskiy on 2/19/23.
//

import UIKit

class GameViewController: UIViewController {
    
    var timer: Timer!
    let gameBrain = GameBrain.shared
    
    @IBOutlet weak var targetLetter: UILabel!
    
    @IBOutlet weak var score: UILabel!
    
    @IBOutlet weak var seconds: UILabel!
    
    @IBOutlet var letterBtns: [UIButton]!
    
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let length = letterBtns.count
        
        gameBrain.newGame(numLetters: length)
        updateUI()
        configureTimer()
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        timer.invalidate()
    }
    
    func configureTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: fireTimer(timer:))
        RunLoop.current.add(timer, forMode: .common)
    }
    
    func updateUI() {
        targetLetter.text = gameBrain.targetLetter
        var scoreText = String(gameBrain.score)
        var secondsText = String(gameBrain.secondsRemaining)
        
        score.text = "Score:\(scoreText)"
        seconds.text = "Seconds:\(secondsText)"
        
        for i in 0..<letterBtns.count {
            letterBtns[i].setTitle( gameBrain.randomLetters[i], for: .normal)
            
        }
        
    }
    
   
    @IBAction func letterButtonTapped(_ sender: UIButton) {
        
        sender.backgroundColor = UIColor.red
        
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { _ in
            
        }
        
        if let letterKey = sender.titleLabel?.text{
            
            gameBrain.letterSelected(letterPressed: letterKey)
            
        }
        
        
        updateUI()
    }
    
    
    func fireTimer(timer: Timer) {
        gameBrain.secondsRemaining -= 1
        updateUI()
        
        if gameBrain.secondsRemaining <= 0 {
            timer.invalidate()
            navigationController?.popToRootViewController(animated: true)
        }
    }
}
