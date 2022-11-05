//
//  ScoreViewController.swift
//  myGame
//
//  Created by Arina Postnikova on 30.10.22.
//

import UIKit

class ScoreViewController: UIViewController {
    
    private var isFirstLoad = true
    
    private var firstScore: Int = 0
    private var secondScore: Int = 0
    private var thirdScore: Int = 0
    
    private var scores = [Int]()

    // MARK: - IBOutlets
    @IBOutlet weak var firstScoreLabel: UILabel!
    @IBOutlet weak var secondScoreLabel: UILabel!
    @IBOutlet weak var thirdScoreLabel: UILabel!
    
    // MARK: - Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        if isFirstLoad {
            updateScores()
            isFirstLoad = false
        }
    }
    
    private func updateScores() {
        scores = Scores.shared.getScores()
        
        if scores.count > 0 {
            firstScore = scores[0]
        }
        if scores.count > 1 {
            secondScore = scores[1]
        }
        if scores.count > 2 {
            thirdScore = scores[2]
        }
        
        firstScoreLabel.text = String(UserDefaults.standard.integer(forKey: "firstScore"))
        secondScoreLabel.text = String(UserDefaults.standard.integer(forKey: "secondScore"))
        thirdScoreLabel.text = String(UserDefaults.standard.integer(forKey: "thirdScore"))
    }
}
