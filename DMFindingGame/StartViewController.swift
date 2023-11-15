//
//  StartViewController.swift
//  DMFindingGame
//
//  Created by David Ruvinskiy on 4/17/23.
//

import UIKit

class StartViewController: UIViewController {
    
    @IBOutlet weak var highScore: UILabel!
    
    let gameBrain = GameBrain.shared
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        var highScoreText = gameBrain.highScore
        
        highScore.text = "High Score:\(highScoreText)"
        
    
        
    }
    
    //    @IBAction func startBtn(_ sender: UIButton) {
    //        let gameViewController = GameViewController()
    //
    //        navigationController?.pushViewController(gameViewController, animated: true)
    //    }
    //
    //
}
