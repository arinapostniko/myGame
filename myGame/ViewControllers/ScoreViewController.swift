//
//  ScoreViewController.swift
//  myGame
//
//  Created by Arina Postnikova on 30.10.22.
//

import UIKit

class ScoreViewController: UIViewController {
    
    // MARK: - Private properties
    private var isFirstLoad = true
    private var scores = [ScoreModel]()

    // MARK: - IBOutlets
    @IBOutlet weak var firstScoreLabel: UILabel!
    @IBOutlet weak var secondScoreLabel: UILabel!
    @IBOutlet weak var thirdScoreLabel: UILabel!
    
    @IBOutlet weak var firstDateLabel: UILabel!
    @IBOutlet weak var secondDateLabel: UILabel!
    @IBOutlet weak var thirdDateLabel: UILabel!
    
    @IBOutlet weak var backgroundImage: BackgroundImageView!
    
    // MARK: - Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundImage.makeBlur()
        
        if isFirstLoad {
            updateScores()
            isFirstLoad = false
        }
    }
    
    // MARK: - Private methods
    private func updateScores() {
        scores = Storage.shared.scores
        
        while scores.count < 3 {
            scores.append(ScoreModel(score: 0, date: ""))
            Storage.shared.scores = scores
        }
        
        firstScoreLabel.text = "\(scores[0].score)"
        secondScoreLabel.text = "\(scores[1].score)"
        thirdScoreLabel.text = "\(scores[2].score)"
        
        firstDateLabel.text = "\(scores[0].date)"
        secondDateLabel.text = "\(scores[1].date)"
        thirdDateLabel.text = "\(scores[2].date)"
    }
}
